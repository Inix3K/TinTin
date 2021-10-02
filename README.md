# TinTin++

## Required Version
* TinTin++ version 2.01.90 or higher required

    Certain aspects are not backwards compatible with older versions of TinTin++ due to syntax changes within the client.  Notably, the `#map` and `#showme` commands.

## Initial Setup

First, you need to determine your desired method of using TinTin++.  My recommendations, in order of preference:
1. Use a VPS with LINUX (free tier)
	* Google Cloud Platform (GCP) - https://cloud.google.com/compute/docs/quickstart-linux
	* Amazon Web Services (AWS)
2. Local Linux Install
3. Windows Subsystem for Linux (WSL)
4. WinTin

The VPS will allow you to connect to your session from any device, makes swapping from desktop to mobile, etc., much easier and allows your session to continue running with no need to do multiple setups for multiple devices.
_Recommend using minimal Ubuntu install (I.E.:  Ubuntu 20.04 LTS Minimal) on free-tier VPS to minimize additional installs that aren't needed and can bog down the free-tier server._

The majority of instructions will assume VPS with Ubuntu.

Once VPS with Ubuntu is setup, below are the install directions from:  https:/tintin.mudhalla.net/install.php#Ubuntu
```
sudo apt install zlib1g-dev
sudo apt install libpcre3-dev
sudo apt install libgnutls28-dev
sudo apt install wget
sudo sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list
sudo apt update
sudo apt install build-essential
sudo apt build-dep tintin++
wget https://downloads.sf.net/tintin/tintin-2.02.10.tar.gz
tar -zxvf tintin-2.02.10.tar.gz
cd tt/src
./configure
sudo make install
```

Change directory back to home directory<br/>
`cd`

Install git and tmux
```
sudo apt install git
sudo apt install tmux
```

Clone the git<br/>
`git clone https://github.com/Inix3K/TinTin`

Copy git repo into .tt folder (this will allow you to copy files from the repo and allow manual overwrite of local files)<br/>
`cp -r TinTin .tt`

Copy .profile to home directory and initialize it.  This adds aliases to connect to TMUX (explained below).
```
cp .tt/scripts/.profile ~/
. .profile
```

Create bin folder and copy scripts to it
```
mkdir bin
cp .tt/scripts/* ~/bin/
```

Save your 3k password
```
cd .tt
vi .pass
```
* _Use any text editor you like here, I use VIM.  Just create the file, put your password in it, and save it.  Nothing else in the file._

Make your initial character file
```
cd char
vi <player_name>.tin
	* i   (enters Insert mode)
	* #read .tt/3k/guilds/<guild_name>.tin
	* Esc (this will exit Insert mode)
	* ZZ  (this will save and close the file)
* I.E.: For jugger
	* vi inix.tin
	* #read .tt/3k/guilds/juggernaut.tin
	* Esc
	* ZZ
```
_NOTE:  connect alias will assume MUD is 3K.  For 3S, append "3s" to your character file name._<br/>
	_I.E.: `vi inix3s.tin`_

## Connect to the MUD
Now that you have the initial setup done, it's time to get playing!<br/>
Type `cd` to return to the home directory

TMUX Connection Aliases:
* `3k`:  This will start a tmux session named '3K' and open TinTin++ with rc.tin configuration file
		* If a tmux session is already started, this alias will also disconnect the tmux session from any other devices and reconnect you to it.  You can use this to swap from desktop to mobile, etc.
* `3kx`:  This is similar to the `3k` alias, except it will leave other sessions connected.  If you want to be connected on mobile AND desktop, for instance.
* `trcc`:  This is the script that the `3k` alias calls (located in your ~/bin/ folder).  However, if you want tmux sessions other than '3K' you can use this.
	* I.E.: `trcc 3s`:  This will start a tmux session called '3s' and connect you to it.
* `trcx`:  Similar to `3kx` above, except you must pass the session name.
	* I.E.: `trcx 3s`:  reconnect to session named '3s' while leaving other sessions attached.

Now that you're at the TinTin++ screen, connect to your character
* `connect <player_name>`:	This will attempt to log you into 3K with the player name you pass and your password saved in .tt/.pass
	* If you want to connect to 3S, append '3s' to the end of the player name.
		* I.E.:  `connect inix3s`
		* Once the alias detects '3s' as the last two characters of the player name, it will connect to 3s instead of 3k, and will load the 3s character file.  In this example, it will load '.tt/char/inix3s.tin' instead of '.tt/char/inix.tin'

## MUD ANSI Setup
Certain ANSI flags are set for mapper and stepper functions.  To load these flags:
* `#read .tt/3k/ansi_setup.tin`

## MAP Commands
* `mapon`:  This will set variables to collect room shorts, room exits, room descriptions, etc., as well as set the mud brief mode appropriately to begin mapping.
* `mapoff`:  This will stop the active mapping mode.
* `mapsave`:  Write the map to file.  There are no 'automatic' saves for the map intentionally, to allow for testing and mistakes to not overwrite your hard-earned 3K map.  Therefore, be sure to 'mapsave' after any intentional map updates.
* `notelist`:  List all current roomnotes.  These are used as 'waypoints' go the 'go' alias so you can go to specific areas in the mud.  You can add a 'roomnote' to set any other specific 'waypoints' you want.
* `mapgo <note>`:  This will move your position in the map to the passed roomnote.
* `go <note>`:  Run to the position of the passed roomnote.

## Draw Commands
`rs`:  Reads the draw.tin file.  Useful to redraw the screen if something gets fubared.<br/>
`redraw <pane> [on|off]`:  This will toggle a pane off or on, or set it to off or on specifically if that argument is passed.<br/>
* Panes:
	* chat:  The chat monitor (top or top-left)
	* map:  The map (top-right by default, can be bottom right [see mappos below])
	* caption:  The caption bar showing uptime/reboot/lag/idle/cycle
	* alert:  The alert bar 1-column wide, on the left of the main MUD buffer.  This will turn green after 10min idle, yellow after 14min idle, and red after 15min idle.
	* canvas:  This is the area on the right of the MUD buffer were Area Cycler is shown, or where the map is shown if in bottom position.
	* gline:  Guild Line data, just above the hpbar.
	* hpbar:  HP Bar, below gline and above input.
`mappos [top|bottom]`:  Alone it will toggle the map from the top or bottom position, or set it to the specific position if passed.  It remains on the right side.
		

## Stepper (bot) Commands
* Single area mode:
* `- <stepper name>` :  Load an area stepper
* `..` :  Step through the loaded stepper

Multi-area mode (aka Bot Cycler)
* `ba <stepper>`:   bot-add, add an area stepper to the cycler list.
* `br <index>`:     bot-remove, remove an area from the cycler list.  Note you pass the index number, not the area name for this.
* `thisarea`:       Run to start of current area (the one highlighted on the cycle list) and start the stepper.
* `nextarea`:       Run to start of next area on the cycle list and start the stepper.
* `botclear`:       Clear the bot cycle list.
* `cycle <index>`:  Sets the bot cycle to the passed index.

General stepper commands:
* `.stop`:  stops the stepper, but keeps it 'active'.
* `.resume`:  Run to current room of the stepper and restarts it
* `killbot`:  stops the stepper and closes it.  This unsets many variables, and as such, you cannot '.resume' after a killbot
* `.dcr`:  DisConnect Resume, if you disconnect (normally, a crash will not write variables) and have not loaded a stepper on another character or anything, then this will re-load the last saved bot variables, run to the stopped room, and resume the stepper.  After a normal disconnect, stepper and path variables are written.  This will load those variables, and then act as a normal `.resume`.

## Mouse Commands
Mouse scrolling has been enabled!  Default is scrolling one page at a time.
* Chat Monitor:  Mouse wheel up/down will scroll up or down one unit
* Buffer:  Mouse wheel up/down will scroll up or down one unit
* Input:  The hpbar and gline are considered in the 'input' area for this function.  Mouse wheel up/down will scroll up or down through a single command history.

Double-Click
* Double-click the chat monitor will toggle between 'page' and 'line' scrolling for the chat monitor
	* This sets the $chat[scroll] variable to 'page' or 'line'
* Double-click the main buffer will toggle between 'page' and 'line' scrolling for the buffer.
	* This sets the $screen[scroll] variable to 'page' or 'line'

Map Mouse Functions
* Single-click on Map room:  display `#map info` for the clicked room
* Double-click on Map room:  move map to clicked room
* Triple-click on Map room:  run to clicked room
