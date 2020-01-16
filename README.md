# TinTin++

## Required Version
* TinTin++ version 2.01.90 or higher required

    Certain aspects are not backwards compatible with older versions of TinTin++ due to syntax changes within the client.  Notably, the #map and #showme commands.

## Highlighted features:

#### graph.tin
* Graphical status bars function

### 3k/3s:
#### 3k/mapper.tin
* Mapper setup to automap for 3K or 3S  
* Autoadds exit-stubs and colors them red to see rooms you haven't visted yet  
* Data capture for room short, long desc, area name  
* Map follow on following others  
* Transports for uncommon exits / moving areas  
		  
#### 3k/mip.tin
* Modified from Balthus' original script.
* Chat monitor for all lines and tells/souls.
* Status updates for character, even out of combat
* Mob health in percentage, regardless of mob or mskills
* Caption updating (top TinTin split) with Uptime, Reboot, Lag, and Idle timer

#### 3k/assemble.tin
* Craft satchel auto-assembler

### Aardwolf:

#### map/AWmap.tin
* Additional mapping features not included in the gmcp module
* Data captures for longdesc
* Aliases for easier map movement and mob hunting
* Capture of AW mini-map
* Auto saves map on disconnect

#### AW/gmcp.tin
* Modified from TheIxle's original script.
* Chat monitor for all lines
* Status updates integrated with graph function
* Auto-mapping with exit-stubs
* Terrain mapping to set roomsymbol to Aardwolf style terrain on adding new rooms

#### AW/terrain.tin
* Set rooms currently in your map to Aardwolf style terrain

#### AW/snd.tin
* Search and Destroy style mob hunting for TinTin

## Initial Setup

### General Steps

NOTE: tmux is NOT required for using these scripts. All the windowing magic is handled directly by tt++

* Ensure you have the minimum required version of TinTin++ installed
* Clone or download the git repository to your home directory
* Rename the cloned (or extracted) folder to .tt (some scripts have this path hard-coded currently)
    mv TinTin .tt
* \[Optional\] Add an alias to your .profile similar to the following, and run ". .profile" to read in the changes:
    alias tt='tt++ ~/.tt/.tinrc'
* Create a new file called .tt/.pass and add the following:
    #send <your password>

### 3k/3s

* Create a copy of .tt/char/template.tin, and name it for your character
    * \[Optional\] Several character templates specific to Inix's characters already exist. You may choose one of these
    to get a solid baseline for future customization rather than the empty template if one aligns to your guild.
* Edit the newly created character file, and add your name (and guild if using the template)
* Use the alias created in General Steps above to launch TinTin++
* Connect to 3k or 3s with:
    connect <your character name>
* The mapper feature relies on specific settings within 3k/3s. Use the following command once connected to ensure these are set. This only needs to be done once.
    #read .tt/3k/ansi_setup.tin

### Aardwolf

* Create a copy of .tt/char/inixAW.tin, and name it for your character (leaving the AW at the end)
* Use the alias created in General Steps above to launch TinTin++
* Connect to Aardwolf with (note the AW at the end):
    connect <your character name>AW  
* The mapper feature relies on specific settings within Aardwolf. Ensure these mud-side settings are in place
    TBD
* The status bars require a specific prompt to be setup. Set your prompts as follows:
    TBD
