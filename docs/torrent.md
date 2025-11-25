# Torrent

Torrent is the the process to download and share files using peer-to-peer
network. Ideally, we can install a torrent client in my raspberry and download
files directly to NAS.

## Torrent client options

There are multiple torrent clients available for that can be installed in a
Raspberry. Some of the most common are:

- [Transmission](https://github.com/transmission/transmission): lightweight,
  easy to use, web interface available.
- [qBittorrent](https://github.com/qbittorrent/qBittorrent): more complete,
  includes search engine, web interface available.
- [Deluge](https://github.com/deluge-torrent/deluge): more advanced, plugins
  available, web interface available.

I have not decided yet which one to use. Transmission is a good option and I
used in the past, but having a search engine embedded (such as in qBittorrent)
is interesting.

## Transmission - Installation and Setup

As a quick win, I will install
[Transmission](https://github.com/transmission/transmission) first. Later, I can
try other client if needed.

```bash
sudo apt-get install transmission-daemon
```

Once installed, we can start configuring Transmission. As I mentioned before, I
want to use NAS folder to store downloaded files. So, let's create new folders
inside NAS. I don't want to create folders with sudo, to avoid any permission
issues.

```bash
mkdir -p /mnt/nas/torrent/in-progress
mkdir -p /mnt/nas/torrent/completed
```

Next, small changes are required in transmission configuration file. It is
located at `/etc/transmission-daemon/settings.json`. Make sure the daemon is
stopped before editing the configuration file:

```bash
sudo systemctl stop transmission-daemon
sudo systemctl status transmission-daemon
sudo vim /etc/transmission-daemon/settings.json
```

Inside configuration file, we need to set the following parameters:

```json
    ...
    "download-dir": "/mnt/nas/torrent/completed",
    ...
    "incomplete-dir": "/mnt/nas/torrent/in-progress",
    "incomplete-dir-enabled": true,
    ...
    "rpc-password": "your_password",  # will be hashed on start
    "rpc-username": "your_username",
    "rpc-whitelist": "192.168.1.*",
    ...
```

Make sure to set `rpc-whitelist` to your network range, so you can access web
interface from your computer.

Transmission daemon uses `debian-transmission` user and we need to update it in
the daemon configuration to `pi` to avoid any privilege issues. Also, change the
ownership of the configuration folder to `pi` user.

``` bash
sudo vim /etc/init.d/transmission-daemon
# Change USER=debian-transmission to USER=pi
sudo vim /etc/systemd/system/multi-user.target.wants/transmission-daemon.service
# Change User=debian-transmission to User=pi

sudo chown -R $USER:$USER /etc/transmission-daemon
```

After these changes, reload daemon and start transmission-daemon. Check daemon
status to verify it is running:

```bash
sudo systemctl daemon-reload
sudo systemctl start transmission-daemon
sudo systemctl status transmission-daemon
```

If everything is correct, you can access the transmission UI at
`http://<RASPBERRY_PI_IP>:9091`. Login with the username and password set in the
configuration file. You can now add torrent files or magnet links to start
downloading, and monitor the download progress.

## Troubleshooting

- In case of 403 error when accessing web interface, probably
  transmission-daemon was picking a different configuration file. I found in
  logs that configuration file used was
  `/home/$USER/.config/transmission-daemon/settings.json`. I removed that file
  and created a symlink to `ln -s /etc/transmission-daemon/settings.json
  /home/$USER/.config/transmission-daemon/`. After restarting
  transmission-daemon, web interface worked correctly.

## References

- [Transmission Guide](https://pimylifeup.com/raspberry-pi-transmission/)
