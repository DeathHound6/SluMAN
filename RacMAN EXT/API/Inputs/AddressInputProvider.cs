using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace RacMAN.API.Inputs;

/// <summary>
/// Provides inputs by reading them from an address in game memory.
/// </summary>
internal class AddressInputProvider : IInputProvider
{
    private bool reverseButtons = false;
    private uint buttonSpacing = 0x1;
    public InputState Inputs => new InputState
    {
        Buttons = _buttons,
        RX = rx,
        RY = ry,
        LX = lx,
        LY = ly
    };

    /// <summary>
    /// Snugggles Changes; buttonOffset, buttonEndianness, stickEndianness, stickPositionSwap
    /// These have been added to make it a more flexible tool for games other than the Ratchet and Clank games, since other
    /// games likely have different Memory layouts. The buttonEndianness and stickEndianness could be removed if
    /// the API to see whether it's Console or Emulator can be implemented into this, to change Endianness automatically.
    /// </summary>
    /// <param name="API"></param>
    /// <param name="buttonAddress"></param>
    /// <param name="buttonOffset"></param> A value that gets added to the original buttonAddress to read the second half of the controls, in case some games have weird memory layouts
    /// <param name="buttonEndianness"></param> Bool, if True then it reverses the way Memory is read. True for RPCS3, False for actual Console
    /// <param name="analogAddress"></param>
    /// <param name="stickEndianness"></param> Bool, see buttonEndianness
    /// <param name="stickPositionSwap"></param> Bool, in case for some reason, a game hase the sticks in the opposite order in Memory
    public AddressInputProvider(MemoryAPI API, uint buttonAddress, uint buttonOffset, bool buttonEndianness, uint analogAddress, bool stickEndianness, bool stickPositionSwap)
    {
        API.SubMemory(buttonAddress, 4, button);

        if (API.GetGameTitleID() == "NPHA80175")
        {
            API.SubMemory(analogAddress, 8, bytes =>
            {
                if (stickEndianness == true)
                {
                    bytes = LuaFunctions.ReverseArray(bytes);
                }
                ly = -1 * BitConverter.ToSingle(bytes, 0);
                lx = BitConverter.ToSingle(bytes, 4);
            });
            API.SubMemory(analogAddress + 0x34, 8, bytes =>
            {
                if (stickEndianness == true)
                {
                    bytes = LuaFunctions.ReverseArray(bytes);
                }
                ry = -1 * BitConverter.ToSingle(bytes, 0);
                rx = BitConverter.ToSingle(bytes, 4);
            });
        }
        else
        {

            if (stickPositionSwap == true)
            {
                API.SubMemory(analogAddress, 2, bytes =>
                {
                    // I thought endianness didn't apply to floats, but I was wrong.

                    if (stickEndianness == true)
                    {
                        bytes = LuaFunctions.ReverseArray(bytes);
                    }
                    ry = (float)(Convert.ToInt32(bytes[0]) - 127) / 128f;
                    rx = (float)(Convert.ToInt32(bytes[1]) - 127) / 128f;

                    if (rx > 0 && ry != 0)
                    {
                        ry = MathF.Sin(MathF.Atan(ry / rx));
                        rx = MathF.Cos(MathF.Atan(ry / rx));
                    }
                    else if (rx < 0 && ry != 0)
                    {
                        ry = -MathF.Sin(MathF.Atan(ry / rx));
                        rx = -MathF.Cos(MathF.Atan(ry / rx));
                    }
                });
                API.SubMemory(analogAddress + 44, 2, bytes =>
                {
                    if (stickEndianness == true)
                    {
                        bytes = LuaFunctions.ReverseArray(bytes);
                    }
                    ly = (float)(Convert.ToInt32(bytes[0]) - 127) / 128f;
                    lx = (float)(Convert.ToInt32(bytes[1]) - 127) / 128f;

                    if (lx > 0 && ly != 0)
                    {
                        ly = MathF.Sin(MathF.Atan(ly / lx));
                        lx = MathF.Cos(MathF.Atan(ly / lx));
                    }
                    else if (rx < 0 && ry != 0)
                    {
                        ly = -MathF.Sin(MathF.Atan(ly / lx));
                        lx = -MathF.Cos(MathF.Atan(ly / lx));
                    }
                });
            }
            else
            {

                API.SubMemory(analogAddress, 2, bytes =>
                {
                    // I thought endianness didn't apply to floats, but I was wrong.

                    if (stickEndianness == true)
                    {
                        bytes = LuaFunctions.ReverseArray(bytes);
                    }
                    ly = (float)(Convert.ToInt32(bytes[0]) - 127) / 128f;
                    lx = (float)(Convert.ToInt32(bytes[1]) - 127) / 128f;

                    if (lx > 0 && ly != 0)
                    {
                        ly = MathF.Sin(MathF.Atan(ly / lx));
                        lx = MathF.Cos(MathF.Atan(ly / lx));
                    }
                    else if (lx < 0 && ly != 0)
                    {
                        ly = -MathF.Sin(MathF.Atan(ly / lx));
                        lx = -MathF.Cos(MathF.Atan(ly / lx));
                    }
                });
                API.SubMemory(analogAddress + 44, 2, bytes =>
                {
                    if (stickEndianness == true)
                    {
                        bytes = LuaFunctions.ReverseArray(bytes);
                    }
                    ry = (float)(Convert.ToInt32(bytes[0]) - 127) / 128f;
                    rx = (float)(Convert.ToInt32(bytes[1]) - 127) / 128f;

                    if (rx > 0 && ry != 0)
                    {
                        ry = MathF.Sin(MathF.Atan(ry / rx));
                        rx = MathF.Cos(MathF.Atan(ry / rx));
                    }
                    else if (rx < 0 && ry != 0)
                    {
                        ry = -MathF.Sin(MathF.Atan(ry / rx));
                        rx = -MathF.Cos(MathF.Atan(ry / rx));
                    }
                });
            }

        }

        reverseButtons = buttonEndianness;
        buttonSpacing = buttonOffset;
    }


    private ButtonState _buttons;
    private float rx, ry, lx, ly;

    private void button(byte[] bytes)
    {
        if (reverseButtons == true)
        {
            bytes = LuaFunctions.ReverseArray(bytes);
        }
        int b = BitConverter.ToInt32(bytes);

        this._buttons = new ButtonState()
        {
            Select = (b & 0x1) != 0,
            L3 = (b & 0x2) != 0,
            R3 = (b & 0x4) != 0,
            Start = (b & 0x8) != 0,
            DUp = (b & 0x10) != 0,
            DRight = (b & 0x20) != 0,
            DDown = (b & 0x40) != 0,
            DLeft = (b & 0x80) != 0,
            L2 = (b & (0x100 * buttonSpacing)) != 0,
            R2 = (b & (0x200 * buttonSpacing)) != 0,
            L1 = (b & (0x400 * buttonSpacing)) != 0,
            R1 = (b & (0x800 * buttonSpacing)) != 0,
            Triangle = (b & (0x1000 * buttonSpacing)) != 0,
            Circle = (b & (0x2000 * buttonSpacing)) != 0,
            Cross = (b & (0x4000 * buttonSpacing)) != 0,
            Square = (b & (0x8000 * buttonSpacing)) != 0,
        };
    }
}
