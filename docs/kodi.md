# Kodi

Kodi is an open source media center application that can be installed in
Raspberry Pi to organize and play multimedia content like videos, music, and
pictures.

## Installing Kodi

Kodi can be installed from Retropie setup script. To do so, run the following
command in a ssh session:

```bash
sudo ~/RetroPie-Setup/retropie_setup.sh
```

Navigate to `Manage packages -> Optional packages -> kodi` and select
`Install from binary`. It can take a bit, be patient. After installation, you
need to restart the raspberry pi to apply changes and you will see Kodi in the
EmulationStation menu.

## Configure Kodi

After opening the application Kodi on the menu, first thing to configure is the
input controller. By default, only keyboard input is detected, so if you want to
use any other device you need to configure it. Go to `Settings -> Input ->
Configure attached controllers`, select the device and set the buttons.

Many other configuration can be done, from video or audio settings. Be sure you
set the wheel to `Expert` to see all the options available.

### Accessing Kodi remotely

You can access Kodi from outside raspberry, like your phone and use it as remote
or your laptop. To do this, see the settings required:

```text
Settings -> Allow remote control via HTTP -> Enable
Settings -> Enable remote control from applications on other systems
```

> Don't forget to set port, user and password to connect to Kodi. And save the
> data in a safe place.

After that, you should be able to access Kodi from your laptop with the ip and
the information from above. Just go to `http:<ip>:<port>` and logging with
user/password.

To use your phone as remote, all you need is to install the official remote
controller app for Kodi, Kore. It is available for Android and iOS devices. You
can download it from Google Play Store or Apple App Store.

> You will need the ip where Kodi is running, port, user and password.

## Setting Kodi as media center

By default, you will see your Movies/TV Shows libraries empty. To feed them, we
need to prepare a but the data with a defined structure so Kodi scrapper can
recognize the items inside. In my NAS folder, I've created the following schema,
so we know exactly where to put each kind of video:

```text
.KodiMedia/
    -> Movies/
    -> TV Shows/
    -> Private videos/
```

Inside [Movie](https://kodi.wiki/view/Naming_video_files/Movies) folder, each
movie should be saved in its own folder. Name of the folder and name of the file
should follow the following format: `Movie Name (Year)`.

Inside [TV Shows](https://kodi.wiki/view/Naming_video_files/TV_shows) folder,
the structure is a bit more rigid. Create one folder per TV Shown, and inside
one folder per Season, where `Season XX` string must be in the name of the
folder. Each video item in the folder must contain `SXXEYY`, where `XX` is the
number of the season and `YY` is the number of the episode inside the season.

Your folder schema should look now something like these:

```text
Movies/
    Its A Wonderful Life/
        Its A Wonderful Life.mkv
        Its A Wonderful Life.srt
    ...
TV Shows/
    Modern Family/
        Modern Family Season 10/
            S10E01.mkv
            S10E02.mkv
            ...
        Modern Family Season 11/
            S11E01.mkv
            S11E02.mkv
            ...
    Orange is the new black/
        Orange is the new black Season 7/
            Beginning of the End S07E01.mkv
            Just Desserts S07E02.mkv
            ...
    ...
```

One the structure is ready, you can go in the menu to Movies or TV shows and set
them as [media sources](https://kodi.wiki/view/Adding_video_sources). Septs are:

- add a new video source
- browse the folder (corresponding NAS folder)
- enter a name for the media source
- set corresponding content
- choose information provider
- other configuration can be done, use it if required

With this in place, Kodi starts scrapping the folder and searching each item on
the internet using the provider (3pp source) configured. The provider, is the
source of truth, where the information (like summary, thumbnail, tags...) came
from. If this process is correct, Kodi database is updated and your items will
appear in the corresponding section (it can take time if your folder has many
items).

If your items does not appear, review the following:

- If the files cannot be access manually, problem is with your folder structure
  is correct.
- If the information on the folder is not available, problem is with the
  scrapper provider. Make sure provider add-on is working fine. Go to `Settings
  -> Add-on -> Providers`. If the one used is with a ✖️, means it is not working
  fine. Try to update or use other provider (one that have ✔️ icon) for your
  folder.

You can configure in `Settings -> Video` option your video as you want. I
recommend to enable `Update library on start up` so your Kodi library is
updated.

In a nutshell,

- configure your folders/files
- configure media sources
- make sure the provider can be use in your media source

### Elementum Add-on

Elementum is a torrent client add-on for Kodi. It allows you to stream movies
and TV shows directly from torrent files, just search for the content, select
the torrent file and start streaming.

To install it, I've downloaded the latest version of the plugin as zip file from
[Elementum GitHub](https://elementumorg.github.io/) and install add-on from zip.
Kodi will do the rest. It may take a while, I even got an error and required to
restart Kodi, but after that, plugin was available.

> Remember to enable settings `Enable Remote Control` and
> `Enabling Unknown sources on Kodi` before hand.

After installation, just go to `Add-ons -> Video add-ons -> Elementum` and start
using it. Not much is required, but I recommend to configure a couple of things:

- Enable web UI access, so it can be used from your laptop or phone.
- Set a custom folder to download the content, preferably different from Kodi
  media sources.

At first sight, I can see couple of issues. For TV Shows, I need to search
episode by episode, which makes it hard to manage. Also, I was expecting that
downloaded items will appear automatically in the Kodi library, independently of
the location. But only media sources configured as Movies or TV Shows will be
updated automatically, so I need to manually move it to the corresponding
Kodi media source.

So I won't consider using Elementum add-on on daily basis, but it could be handy
for a quick win if I don't have a movie or cannot find a entire season easily.
Just search and play. In case you want to permanently have an item in Kodi
library, I recommend to use the interface, download an item and move it into my
Kodi media source.

## References

- [Kodi Wiki](https://kodi.wiki/view/Main_Page)
- [Elementum Add-on](https://howtomediacenter.com/en/install-elementum-kodi/#downloading-elementum)
