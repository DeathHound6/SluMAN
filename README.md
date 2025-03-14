# SluMAN
Speedrun tool for Sly Cooper games, on console and emulator, based on [racman](https://github.com/MichaelRelaxen/racman)

### Currently supported games:
- Sly 2 digital download (KOR)
- Sly 3 digital download (PAL)

## Building
1. Use Visual Studio 2022
2. Clone the GitHub repository
3. Click Build > Build Solution

## Using on PS3
You need a homebrew-enabled PS3 (either CFW or HEN) and webMAN MOD installed. Additionally you need the Ratchetron server VSH plugin installed (this is not currently included with the program). Launch the original [racman](https://github.com/MichaelRelaxen/racman) program once to install Ratchetron on your PS3.
1. Open SluMAN.
2. Enter your PS3's IP address and click 'Attach'. (If you use HEN, make sure it is enabled first.)

Be sure to close SluMAN before closing the game or turning off your PS3, or crashes/hardlocks may occur.

## Using on RPCS3
1. Open RPCS3 (don't start the game yet)
2. Click Configuration > IPC and check the box that says "Enable IPC Server". Note the IPC server port. Click "Save"
3. Start SluMAN.
4. Click 'RPCS3'

Please note that you'll need to reconnect SluMAN if you switch games.

## Using autosplitters with LiveSplit

### 1.8.28 and before:
You'll need to install the [LiveSplit Server component](https://github.com/LiveSplit/LiveSplit.Server/releases) and add it to your layout.

### 1.8.29 and after:
Everything should work right out of the box... hopefully

## Credits & Acknowledgments
- [racman](https://github.com/MichaelRelaxen/racman) contributors
- [webMAN MOD](https://github.com/aldostools/webMAN-MOD) contributors
- [bordplate](https://github.com/bordplate), for the [Ratchetron](https://github.com/bordplate/Ratchetron) API
- Some icons from [aha-soft.com](http://www.small-icons.com/packs/16x16-free-application-icons.htm) and [softicons.com](https://www.softicons.com/system-icons/refresh-cl-icons-by-tpdk/game-controllers-icon) (free for non-commercial use, as far as I can tell) 
