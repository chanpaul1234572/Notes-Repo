# Delay BIOS boot time 
## To enter the BIOS, we may need to delay the BIOS booting time
## Vmware Fusion
Press **alt + right click** then Open Config File in Editor

Then add:
```
bios.bootDelay = "10000"
```
To delay bios booting time for 10s(10000ms)

Or
```
bios.forceSetupOnce = "TRUE"
```
To force start the setup page