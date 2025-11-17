# NAS

One of the goals of having a Raspberry up and running is to have a NAS (Network
Attached Storage) to store and share files in my local network easily and
rapidly. Raspberry Pi has only a microSD card slot, so I need to connect an
external storage device.

There are multiple ways to share files in a network, like Samba (SMB) or NFS. As
I mainly use Linux based systems, I opted for NFS, as it is more native to
Linux. But both protocols can coexist in the same server, so if I have problems
with NFS, I can always install Samba server too.

## NFS Server Setup

- Enter via ssh into Raspberry and update package libraries:

```bash
sudo apt update
sudo apt upgrade
```

- Install NFS server package:

```bash
sudo apt install nfs-kernel-server -y
```

- Make sure `lsblk` command shows the connected external storage device. In my
  case, it is `sda`.

- First step is to make sure there is a partition in the drive. Use `fdisk` to
  create a new partition if needed:

```bash
sudo fdisk /dev/sda
```

- In the prompt, use `m` to see help options. Use `p` to see current partitions.
  As I had two partitions, I deleted them using `d` option.
- Enter `n` to create a new partition. In the prompts inside, enter `p` for
  primary partition and keep rest of option as default.

- Format the file to `ext4` filesystem. As I have only one partition, it is
  `sda1`. Make sure the device is not mounted.

```bash
sudo umount /dev/sda1
sudo mkfs.ext4 /dev/sda1
```

- Create a folder with appropriate permissions and mount drive to that folder.

```bash
sudo mkdir /mnt/nas
sudo chown -R pi:pi /mnt/nas
sudo mount /dev/sda1 /mnt/nas
```

- This mount is temporary, so to make it permanent, need to edit `fstab` file:

```bash
sudo blkid # get UUID of the partition
sudo vim /etc/fstab # edit fstab file
UUID=[TU_UUID] /mnt/nas ext4 defaults,nofail 0 2 # to mount at boot
```

- Quickly test the fstab file:

```bash
sudo umount /mnt/nas
sudo mount -a
```

- Now, need to configure NFS exports. Edit the exports file:

```bash
id # check your user id and group id
sudo vim /etc/exports
/mnt/nas 192.168.1.0/24(rw,all_squash,insecure,async,no_subtree_check,anonuid=[uid],anongid=[gid])
```

- Restart NFS server:

```bash
sudo exportfs -ra
sudo systemctl restart nfs-kernel-server
```

## Test NFS server from client

- To test correct access, let's test NFS mount from another computer in the same
  network. Create a folder to mount the NAS:

```bash
sudo mkdir /mnt/nas_pi
sudo chown -R $USER:$USER /mnt/nas_pi
sudo mount -t nfs retropie.local:/mnt/nas /mnt/nas_pi
df -h # to check the mount, should show the nfs mount
```

- Now, you can read/write files to `/mnt/nas_pi` folder and they will be stored
  in the external drive connected to Raspberry Pi. To make the mount permanent,
  edit the `fstab` file in the client computer:

```bash
sudo vim /etc/fstab
retropie.local:/mnt/nas /mnt/nas_pi nfs defaults 0 0
```

## Troubleshooting

If speed is slow, you can try to add some options to the mount command, like
`rsize=32768,wsize=32768` to improve performance.

## References

- [Setup NFS](https://pimylifeup.com/raspberry-pi-nfs/)
- [NAS Box Tutorial](https://www.raspberrypi.com/tutorials/nas-box-raspberry-pi-tutorial/)
