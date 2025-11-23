# Emulators and ROMs

Let's define both concepts:

* Emulator: Software that mimics the hardware of a console, allowing you to run
  games designed for that console.
* ROM: A digital copy of a game that can be played on an emulator.

So, to play a game on Retropie, you need to install the appropriate emulator for
the console the game was designed for, and then load the ROM of the game into
that emulator. Retropie does not provide any emulators or roms by default, you
need to install them and add roms by yourself.

## Installing Emulators

You can install emulators via Retropie setup script, that can be run from
Retropie menu in EmulationStation or via terminal.

```bash
sudo ~/RetroPie-Setup/retropie_setup.sh
```

Once the menu is available, you can navigate to `Manage packages > Manage Main
Packages.`. There, you will find a list of the most popular emulators that you
can install easily. Also, you can find more emulators in `Manage packages >
Manage Optional Packages`

### Emulator List

See list of emulators installed in my Retropie:

|Console|Emulator|
|:-----------:|:--------------:|
| [Dreamcast](https://retropie.org.uk/docs/Dreamcast/) | lr-flycast |
| [MAME](https://retropie.org.uk/docs/MAME/) | lr-mame4all-2003-plus |
| [Game Boy Color](https://retropie.org.uk/docs/Game-Boy-Color/) | lr-gambatte |
| [Nintendo 64](https://retropie.org.uk/docs/Nintendo-64/) | lr-mupen64plus |
| [Super Nintendo Entertainment System (SNES)](https://retropie.org.uk/docs/SNES/) | lr-snes9x2002 |

* Note: consider install only the emulators that you are not going to use to
  save space.

## Adding ROMs

First you need is to obtain the ROM files for the game you want to play. You can
find ROMs from various sources online. Make sure to download ROMs from reputable
sources to avoid malware.

Once you have the ROM files, you need to transfer them to your Retropie system.
I used scp command to transfer files from my computer to Retropie:

```bash
scp /path/to/your/rom/file.zip pi@retropie:/home/pi/RetroPie/roms/console_name/
```

Replace `/path/to/your/rom/file.zip` with the actual path to your ROM file on
your computer. Replace `pi@retropie` with your Retropie username and hostname
and `console_name` with the name of the console folder where the ROM should be
placed (this info can be picked in the emulator link).

Once the ROM files are transferred, restart EmulationStation to refresh the game
list. You should now see the newly added games in the appropriate console menu.
Only emulators with ROMs will appear in EmulationStation.

### ROMS List

|Game Title|Console|Playable|
|:-----------:|:--------------:|:--------:|
| [Mario Kart 64](https://www.retrostic.com/roms/n64/mario-kart-64-v1-1-e-83296) | Nintendo 64 | :thumbsup: |
| [Pokemon Red Fire](https://www.retrostic.com/roms/gba/pokemon-fire-red-version-v1-1-82327) | GBA | :thumbsup: |
| [Golden Axe II](https://www.retrostic.com/roms/megadrive/golden-axe-ii-9062) | Mega Drive | :thumbsup: |
| [Ghouls `N Ghosts](https://www.retrostic.com/roms/mame/ghouls-n-ghosts-40858) | MAME | :thumbsup: |
| [Marvel vs Capcom](https://www.retrostic.com/roms/mame/marvel-vs-capcom-clash-of-super-heroes-40814) | MAME | :thumbsup: |
| [Metal slug 3](https://www.retrostic.com/roms/neo-geo/metal-slug-3-10917) | Neo Geo | :thumbsup: |
| [Metal slug 5](https://www.retrostic.com/roms/neo-geo/metal-slug-5-10916) | Neo Geo | :thumbsup: |
| [Street Fighter II](https://www.retrostic.com/roms/mame/street-fighter-ii-the-world-warrior-40828) | MAME | :thumbsup: |

**Note:** For Mame games, you can place ROM files with `.zip` extension in
`RetroPie/roms/arcade/` folder. Keep in mind that not all MAME games run with
same emulator version.
