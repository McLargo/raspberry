# Kodi

> NOTE: this is a draft document, still under construction

Kodi is an application that can be installed from our current retropie OS.
[steps to install KODI from retro pie](https://cordcutting.com/how-to/how-to-install-kodi-on-retropie/)

Install Kore, an app that can be downloaded to smartphones or tables to control
kodi installed in raspberry

I've created some folders in /home/pie to organize better media sources for
Kodi.

```text
.KodiMedia/
    -> Movies/
    -> TV Shows/
    -> Private videos/
```

Files can be copied there via ssh or adding a new samba configuration in
raspberry and adding to samba client in your pc. You can then associated
[media sources to this folders](https://kodi.wiki/view/Adding_video_sources)

Also, it is very important naming of the folders inside this media sources, so
Kodi will read it properly using scrappers (this part requires my
investigation). Basically, it is how Kodi will read folders/files inside, and
fetch additional information from 3pp sources.

[TV Show naming](https://kodi.wiki/view/Naming_video_files/TV_shows)

Folder schema

```text
TV Shows/
    -> Modern Family/
        -> Modern Family Season 10/
        -> Modern Family Season 11/
    -> Orange is the new black/
        -> Orange is the new black Season 7/
```

[Movies naming](https://kodi.wiki/view/Naming_video_files/Movies)

Folder schema

```text
Movies/
    -> Its A Wonderful Life/
        -> Its A Wonderful Life.mkv
        -> Its A Wonderful Life.srt
```
