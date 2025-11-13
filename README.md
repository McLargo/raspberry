# Raspberry

I have a current Raspberry Pi, but I installed without really knowing what I was
doing. Now, I am trying to learn more about it, how to configure it, get proper
software, and use it for various projects.

## Raspberry Pi model details

TODO: select my model from
[https://www.raspberrypi.com/products/](https://www.raspberrypi.com/products/)
and fill in the details below.

- Model:
- CPU:
- RAM:
- Storage:
- Network:

## Getting Started

First thing, is define what are the usage I am looking for. Some common uses
are:

- Retro gaming console
- Home media server
- Remote file storage (NAS)
- Install home automation software
- Web servers for personal projects

Next, I need to select which Operating System (OS) to use. Previously, I used
[Retropie](https://retropie.org.uk/docs/), as it was used mainly for gaming as
it emulates video game consoles.

For what I can see, Retropie is build on top of Raspberry Pi OS (Raspbian) which
allows to later install other software as usual. So, I will install Retropie.

## Retropie Installation

I am following the instructions from
[Retropie website](https://retropie.org.uk/docs/First-Installation/). No need to
check requirements, as this is not the first time I install it. But I will
document step by step the process.

- Insert SD card into computer.
- Downloaded
  [Retropie image for my Raspberry Pi 2/3](https://github.com/RetroPie/RetroPie-Setup/releases/download/4.8/retropie-buster-4.8-rpi2_3_zero2w.img.gz)
  from official [retropie download page](https://retropie.org.uk/download/)
- To install the image into the SD card, there is couple of software available
  that will help us.
- Raspberry Pi Imager is the official software from Raspberry Pi. I've installed
  it via `sudo apt install rpi-imager`. After launched Raspberry Pi Imager, I
  reviewed the options available. I've tried to Erase SD card first, but it
  failed with an error. So, I directly selected "Use custom" option to select
  the downloaded Retropie image, selected the SD card as target, and clicked on
  "Write" button. Also, configured Wireless LAN options to connect to my WiFi
  network on first boot and enabled SSH user/password authentication. This
  option also erased the SD card before writing the image. It also failed.
- Then, I've used
  [Balena Etcher](https://github.com/balena-io/etcher?tab=readme-ov-file#packages),
  which is another popular software to write images to SD cards or USB drives.
  I've downloaded the last release version, installed and launched it. After
  that, I selected the Retropie image as source, the SD card as target, and
  clicked on "Flash!" button.
- After writing the image, remove the SD card from my computer and inserted into
  the Raspberry Pi, powered it on and connect to a monitor via HDMI.
- If we can see the Retropie welcome screen, it means the installation was
  successful.

## Retropie Initial Setup

- First step is to plug in a gamepad controller to configure it. You will be
  prompted to configure the buttons accordingly. My gamepad was detected
  automatically and I configured all the buttons. Note that it is a simple
  device and not all buttons could be configured. To have a better experience, a
  more complete gamepad is recommended.
- After configuring the gamepad, you need to configure the bare minimum options
  from the Retropie menu.
  - WiFi: Configure WiFi connection to my network. I needed to enter my country
    "ES", that needs to be done from `raspi-config`.
  - Raspi-config: used to configure additional Raspberry Pi options. I enable
    ssh, configure hostname and password, expand filesystem, set locale and
    timezone (you can also configure keyboard layout).
  - Audio: Set audio output to HDMI, as it was defaulting to analog.
- There are other optional configurations that can be done, and we will most
  likely come back to them later.
- Show IP option shows the current IP address of the Raspberry Pi, useful for
  remote access: `ssh pi@<IP_ADDRESS>`. You then provide the password set
  before and you will be logged in via ssh.
- Retropie Setup option allows to install additional emulators and packages. I've
  executed `Basic Install` to install the most common packages.

> Note: after you logged in via ssh, you can execute `sudo raspi-config` to
> access the Raspberry Pi configuration menu or `sudo Retropie-Setup/retropie_setup.sh`
> to access the Retropie setup menu. No need to do it from the Retropie GUI.

## Emulators and ROMs

TODO: how to install an emulator, download a rom and play a game
