using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RacMAN.API.Inputs;

/// <summary>
/// Provides inputs by reading them from an address in game memory.
/// </summary>
internal class AddressInputProvider : IInputProvider
{
    public InputState Inputs => new InputState
    {
        Buttons = _buttons,
        RX = rx,
        RY = ry,
        LX = lx,
        LY = ly
    };
    
    public AddressInputProvider(MemoryAPI API, uint buttonAddress, uint analogAddress)
    {
        // Buttons
        API.SubMemory(buttonAddress, 8, button);

        if (API.GetGameTitleID() == "NPHA80175")
        {
            API.SubMemory(analogAddress, 8, bytes =>
            {
                ly = -1*BitConverter.ToSingle(bytes, 0);
                lx = BitConverter.ToSingle(bytes, 4);
            });
            API.SubMemory(analogAddress + 0x34, 8, bytes =>
            {
                ry = -1*BitConverter.ToSingle(bytes, 0);
                rx = BitConverter.ToSingle(bytes, 4);
            });
            /*
            API.SubMemory(analogAddress + 0xC, 2, bytes =>
            {
                lyf = Convert.ToInt32(bytes[0]) - 127;
                lxf = Convert.ToInt32(bytes[1]) - 127;
                if ((lxf==0) && (lyf==0)) { lx=0; ly = 0; }
            });
            */
        } else
        {
            API.SubMemory(analogAddress, 2, bytes =>
            {
                // I thought endianness didn't apply to floats, but I was wrong.
                //bytes = LuaFunctions.ReverseArray(bytes);

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
            API.SubMemory(analogAddress + 34, 2, bytes =>
            {
                //bytes = LuaFunctions.ReverseArray(bytes);
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

    private ButtonState _buttons;
    private float rx, ry, lx, ly;
    private int lxf, lyf;

    private void button(byte[] bytes)
    {
        bytes = LuaFunctions.ReverseArray(bytes);
        int b = BitConverter.ToInt32(bytes);

        this._buttons = new ButtonState()
        {
            Select = ( b & 0x1) != 0,
            L3 = (b & 0x2) != 0,
            R3 = (b & 0x4) != 0,
            Start = (b & 0x8) != 0,
            DUp = (b & 0x10) != 0,
            DRight = (b & 0x20) != 0,
            DDown = (b & 0x40) != 0,
            DLeft = (b & 0x80) != 0,
            L2 = (b & 0x100) != 0,
            R2 = (b & 0x200) != 0,
            L1 = (b & 0x400) != 0,
            R1 = (b & 0x800) != 0,
            Triangle = (b & 0x1000) != 0,
            Circle = (b & 0x2000) != 0,
            Cross = (b & 0x4000) != 0,
            Square = (b & 0x8000) != 0,
        };
    }

    private void button_sly2(byte[] bytes)
    {
        bytes = LuaFunctions.ReverseArray(bytes);
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
            L2 = (b & 0x100) != 0,
            R2 = (b & 0x200) != 0,
            L1 = (b & 0x400) != 0,
            R1 = (b & 0x800) != 0,
            Triangle = (b & 0x1000) != 0,
            Circle = (b & 0x2000) != 0,
            Cross = (b & 0x4000) != 0,
            Square = (b & 0x8000) != 0,
        };
    }
}
