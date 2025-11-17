# Raspberry

Currently, I have a Raspberry Pi with Retropie installed. But I installed
without really knowing what I was doing neither following a proper guide. Now, I
am trying to learn more about it, how to configure it and get proper software to
work in different projects.

## Raspberry Pi model details

- Model: [Raspberry Pi 3 Model B Rev 1.2](https://www.raspberrypi.com/products/raspberry-pi-3-model-b/)
- CPU: Quad Core 1.2GHz Broadcom BCM2837 64bit
- RAM: 1GB
- Storage: microSD card 16GB
- Network: WiFi 2.4GHz, Ethernet
- Ports: 4 USB 2 ports, Full size HDMI.

## Getting Started

First thing is to define what is the usage I am looking for it. This is my
wishlist of features I will like the most:

- Retro gaming console
- Home media server
- Remote file storage (NAS)
- Install home automation software
- Web servers for personal projects

Next, I need to select which Operating System (OS) to use. Previously, I used
[Retropie](https://retropie.org.uk/docs/), as the main usage for the Raspberry
Pi was for gaming, as Retropie emulates video game consoles.

For what I can see, Retropie is build on top of Raspberry Pi OS (Raspbian) which
allows to later install other software as usual. So, I will continue with
Retropie as the base OS.

## Retropie Installation

I am following the instructions from
[Retropie website](https://retropie.org.uk/docs/First-Installation/). No need to
check requirements, as this is not the first time I install it and I know it
worked. The steps I executed were:

- Inserted SD card into computer.
- Downloaded
  [Retropie image for my Raspberry Pi 2/3](https://github.com/RetroPie/RetroPie-Setup/releases/download/4.8/retropie-buster-4.8-rpi2_3_zero2w.img.gz)
  from official [retropie download page](https://retropie.org.uk/download/)
- Reviewed what software to use to install the image into the SD card.
  - [Raspberry Pi Imager](https://www.raspberrypi.com/software/) is the official
    software from Raspberry Pi. I've installed it via
    `sudo apt install rpi-imager`. After launching Raspberry Pi Imager, I
    reviewed the options available. I've tried to Erase SD card first, but it
    failed with an error. So, I directly selected "Use custom" option to select
    the downloaded Retropie image, selected the SD card as target, and clicked
    on "Write" button. Also, configured Wireless LAN options to connect to my
    WiFi network on first boot and enabled SSH user/password authentication.
    This option also erased the SD card before writing the image. But sadly,
    process got stuck on 99% and I had to cancel it.
  -
    [Balena Etcher](https://github.com/balena-io/etcher?tab=readme-ov-file#packages),
    is another popular software to write images to SD cards or USB drives. I've
    downloaded the last release version, installed and launched it. After that,
    I selected the Retropie image as source, the SD card as target, and clicked
    on "Flash!" button. The process started and completed successfully.
- After writing the image, removed the SD card from my computer and inserted
  into the Raspberry Pi, powered it on and connect to a monitor via HDMI.
- If we can see the Retropie welcome screen, so that means the installation was
  successful.

## Retropie Initial Setup

- First step was to plug in a gamepad controller to configure it. You will be
  prompted to configure the buttons accordingly. My gamepad was detected
  automatically and I configured all the buttons. My simple device did not
  allowed me to configure all buttons. To have a better experience, a more
  complete gamepad is recommended.
- After configuring the gamepad, I configured the bare minimum options from the
  Retropie menu.
  - WiFi: Configure WiFi connection to my network. I needed to enter my country
    "ES", that needs to be done from `raspi-config`.
  - raspi-config: used to configure additional Raspberry Pi options. I enabled
    ssh, configured hostname and password, expanded filesystem, set locale and
    timezone (you can also configure keyboard layout).
  - Audio: Set audio output to HDMI, as it was defaulting to analog.
- Show IP option shows the current IP address of the Raspberry Pi, useful for
  remote access: `ssh pi@<IP_ADDRESS>`. You then provide the password set
  before and you will be logged in via ssh.
- Retropie Setup option allows to install additional emulators and packages. I've
  executed `Basic Install` to install the most common packages.

> There is plenty of other configuration that can be done, so you can come to
> the screen to continue you set up. Take into account that after you logged in
> via ssh, you can execute `sudo raspi-config` to access the Raspberry Pi
> configuration menu or `sudo Retropie-Setup/retropie_setup.sh` to access the
> Retropie setup menu. No need to do it from the Retropie GUI.

## Connect to your Raspberry Pi

There are multiple ways to connect to your Raspberry Pi remotely. The most common
are:

- SSH: to access the command line remotely. You can use any ssh client, like
  `ssh` command from linux. Just need to know the IP address of your Raspberry
  Pi in your network. Example: `ssh <user>@<IP_ADDRESS>`. Default user in
  Retropie is `pi`. If you configure your hostname, you can use it instead of IP
  address. Example: `ssh <user>@<hostname>.local`. Password is the one you set
  during configuration.
- VNC: to access the desktop GUI remotely. You need to enable VNC server in
  `raspi-config` first. I got an error, so I fixed by updating package indexes
  `sudo apt-get update` and installing manually `realvnc-vnc-server`. Still, you
  need to enable in `raspi-config` (or by using `systemctl` commands available
  during installation output). Important to reboot your Raspberry Pi to make the
  changes effective. Then, you can use any VNC client, like `Remmina` or
  `VCN viewer` to connect to your Raspberry Pi desktop remotely. Same way as
  ssh, you can use IP address or hostname and a user/password to connect. I had
  some issues connecting to remote desktop. As it is not a use case I need,
  leaving it for later.

## That is the beginning of a journey

Now that I have Retropie installed and configured, I can start installing
additional software to achieve my goals. I don't want to have a long README, so
see a table of contents and link to the documentation related to each topic:

- [NAS](docs/nas.md)
- [Emulators and ROMs](docs/emulators.md)
- [Torrent Client](docs/torrent.md)
- [Kodi Media Center](docs/kodi.md)
