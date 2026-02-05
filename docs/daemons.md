# Daemons

Daemons are background processes that run continuously to perform specific
tasks. Usually, are process that needs to be always running to provide a service
and they boot on system startup. There are examples of daemons like transmission
(for torrent downloading), ssh (for remote access)... Those daemons are
applications already provided by the operating system or third-party packages.
But you can create your own daemons to run custom scripts or applications in the
background.

## Running a script as a daemon

The common use case of a daemon is to run Python scripts created by me. They may
start on system boot and run in the background, without user intervention. To
create a daemon for a Python script, you can use a process manager like
`supervisor` or `systemd`. Supervisor is a popular choice for managing daemons,
but it requires additional software installation, while systemd is included in
most Linux distributions by default.

## Creating a daemon with systemd

To create a daemon with systemd, you need to create a new file in the
`/etc/systemd/system/` directory with a `.service` extension.

See an example of a systemd service file below:

```ini
[Unit]
Description=My Python Daemon # Description of the daemon
After=network.target # Ensure the network is up before starting

[Service]
ExecStart=/usr/bin/python3 /path/to/your_script.py # Command to start the script
WorkingDirectory=/path/to/ # Directory where the script is located
Restart=always # Restart the daemon if it crashes
User=pi # User to run the daemon

[Install]
WantedBy=multi-user.target # Start the daemon in multi-user mode
```

Each time you create a new file or update a service file, you need to reload the
systemd manager configuration to apply the changes. To enable and start the daemon,
you can use the following commands:

```bash
sudo systemctl daemon-reload
sudo systemctl enable your_service.service
sudo systemctl start your_service.service
```

## Creating a daemon with supervisor

First step will be to install supervisor:

```bash
sudo apt-get update
sudo apt-get install supervisor -y
```

Then, you need to create a new configuration file in the
`/etc/supervisor/conf.d/` directory with a `.conf` extension.
See an example of a supervisor configuration file below:

```ini
[program:my_python_daemon]
command=/usr/bin/python3 /path/to/your_script.py # Command to start the script
directory=/path/to/ # Directory where the script is located
autostart=true # Start the daemon on system boot
autorestart=true # Restart the daemon if it crashes
user=pi # User to run the daemon
```

Supervisor provides a command-line tool to manage the daemons. You can use the
following commands to control the daemons:

```bash
sudo supervisorctl reread # Detect changes on the configuration files
sudo supervisorctl update # Update the supervisor with the new configuration
sudo supervisorctl start my_python_daemon # Start the daemon
sudo supervisorctl stop my_python_daemon # Stop the daemon
sudo supervisorctl restart my_python_daemon # Restart the daemon
sudo supervisorctl status my_python_daemon # See status of the daemon
```

> Note: supervisor is a daemon that will run with systemd.

## My daemons

### Telegram Bot

An interesting use case for a daemon is to run your own Telegram bot in your
Raspberry Pi. Telegram offers bots which can interact with users via messages.
Bots can be used for many purposes, like home automation, notifications,
reminders, etc. You send commands to the bot and it executes in the Raspberry Pi
and sends you back the results.

Without a daemon, the bot script would stop running when you close the terminal
or log out from the Raspberry Pi. By creating a daemon for the bot, you ensure
that the bot is always running in the background, ready to respond to your
commands.

More information is available in the
[Telegram Bot](https://github.com/McLargo/telegram-bot) repository.

## References

- [Creating a linux service with systemd](https://medium.com/@benmorel/creating-a-linux-service-with-systemd-611b5c8b91d6)
- [Supervisor documentation](https://supervisord.org/introduction.html)
- [Supervisor example](https://gist.github.com/tsabat/1528270)
