# Installing Operating system images on macOS
## For a **Real Programmer**, you should do everything in Command line.
**[Reference and thanks form Raspberry Pi](https://www.raspberrypi.org/documentation/installation/installing-images/mac.md)**
## For a sdcard with a lock slider, the computer will see it as read/write. If it's fully at unlocked, it'll be read only.
1. Open a terminal, then run:
   
   ```diskutil list``` 
2. Identify the disk(not the partition) of your SD card, e.g. ```disk4```, not ```disk4s1```.
3. Unmount your SD card by using the disk identifier, to prepare it for copying data:
```diskutil unmountDisk /dev/disk<disk# from diskutil>```,

where ```disk``` is your BSD name e.g. ```diskutil unmountDisk /dev/disk4```

4. Copy the data to your SD card:

```sudo dd bs=1m if=image.img of=/dev/rdisk<disk# from diskutil> conv=sync```

where ```disk``` is your BSD name e.g.  ```sudo dd bs=1m if=2018-04-18-raspbian-stretch.img of=/dev/rdisk4 conv=sync```
- This may result in a ```dd: invalid number '1m'``` error if you have GNU coreutils installed. In that case, you need to use a block size of  ```1M``` in the ```bs=``` section, as follows:
```
sudo dd bs=1M if=image.img of=/dev/rdisk<disk# from diskutil> conv=sync
```

5. This will take a few minutes, depending on the image file size. You can check the progress by sending a SIGINFO signal (press **Ctrl+T**).

    If this command still fails, try using disk instead of rdisk, for example:

    ```sudo dd bs=1m if=2018-04-18-raspbian-stretch.img of=/dev/disk4 conv=sync```
    
    or

    ```sudo dd bs=1M if=2018-04-18-raspbian-stretch.img of=/dev/disk4 conv=sync```
6. After the dd command finishes, eject the card:

```sudo diskutil eject /dev/rdisk<disk# from diskutil>```

## Alternative method

**Note**: Some users have reported issues with using this method to create SD cards, possibly because earlier versions of these instructions didn't note that it may be necessary to unmount multiple partitions on the SD card.

These commands and actions must be performed from an account that has **administrator privileges**

1. From the terminal run ```df -h```. For example:
```bash
$ df -h
Filesystem      Size   Used  Avail Capacity iused      ifree %iused  Mounted on
/dev/disk1     233Gi   73Gi  159Gi    32% 1552273 4293415006    0%   /
devfs          189Ki  189Ki    0Bi   100%     654          0  100%   /dev
map -hosts       0Bi    0Bi    0Bi   100%       0          0  100%   /net
map auto_home    0Bi    0Bi    0Bi   100%       0          0  100%   /home
```
2. Connect the SD card reader with the SD card inside.
3. Run ```df -h``` again and look for the new device which was not previously listed. Record the device name(s) of the filesystem's partition(s), for example  ```/dev/disk3s5``` and ```/dev/disk3s1```. Notice the last two lines:
```bash
$ df -h
Filesystem      Size   Used  Avail Capacity iused      ifree %iused  Mounted on
/dev/disk1     233Gi   73Gi  159Gi    32% 1552273 4293415006    0%   /
devfs          189Ki  189Ki    0Bi   100%     654          0  100%   /dev
map -hosts       0Bi    0Bi    0Bi   100%       0          0  100%   /net
map auto_home    0Bi    0Bi    0Bi   100%       0          0  100%   /home
/dev/disk3s5    60Mi   20Mi   40Mi    33%     512          0  100%   /Volumes/boot
/dev/disk3s1   812Mi  740Mi   71Mi    92%       0          0  100%   /Volumes/RECOVERY
```
4. Unmount the partition(s) so that you will be allowed to overwrite the disk:

```
sudo diskutil unmount /dev/disk3s5
sudo diskutil unmount /dev/disk3s1
```

Alternatively, open Disk Utility and unmount the partition of the SD card. Do not eject it. If you eject it, you will have to reconnect it.

5. Using the device name of the partition, work out the raw device name for the entire disk by omitting the final ```s#``` and replacing ```disk``` with ```rdisk```. This is very important, as you will **lose all data on the hard drive if you provide the wrong device name**. Make sure the device name is the name of the whole SD card as described above, not just a partition of it, for example, ```rdisk3```, not ```rdisk3s1```. Similarly, you might have another SD drive name/number like ```rdisk2``` or ```rdisk4```. You can check again by using the ```df -h``` command, both before and after you insert your SD card reader into your Mac. For example: ```/dev/disk3s1``` becomes ```/dev/rdisk3```.

6. In the terminal, write the image to the card with this command, using the raw device name from above. Read the above step carefully to make sure that you use the correct rdisk number here:

    ```sudo dd bs=1m if=2018-04-18-raspbian-stretch.img of=/dev/rdisk3 conv=sync```
    If the above command reports the error  ```dd: bs: illegal numeric value```, change the block size ```bs=1m``` to  bs=1M```.

    If the above command reports the error  ```dd: /dev/rdisk3: Permission denied```, the partition table of the SD card is being protected against being overwritten by Mac OS. Erase the SD card's partition table using this command:

    ```sudo diskutil partitionDisk /dev/disk3 1 MBR "Free Space" "%noformat%" 100%```
    
    That command will also set the permissions on the device to allow writing. Now try the dd command again.

7. Note that dd will not provide any on-screen information until there is an error, or it is finished. When the process is complete, information will be shown and the disk will re-mount. If you wish to view the progress, you can use Ctrl-T. This generates SIGINFO, the status argument of your terminal, and will display information on the process.

8. After the dd command finishes, eject the card:

    ```sudo diskutil eject /dev/rdisk3```

    Alternatively, open Disk Utility and use this to eject the SD card.
