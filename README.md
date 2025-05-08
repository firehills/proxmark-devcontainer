# proxmark-devcontainer
Example of Proxmark3 (Iceman) in a devcontainer


## Win/Host USB translation using usbip
Mapping USB devices between Host(Win11) and Docker 
Win11 host install https://github.com/dorssel/usbipd-win -> (this setup tested with tag v5.0.0)

```
# Some combination of the below, see the usbipd docs
usbipd list 
usbipd bind --busid <busid> 
usbipd attach --wsl --busid <busid>
usbipd detach --busid <busid>
```



## Building the code
```sh
cd /proxmark3/git
cp Makefile.platform.sample Makefile.platform
```

### Set the PLATFORM in Makefile.platform

Proxmark3EASY is build with PM3GENERIC

```sh
#PLATFORM=PM3RDV4
PLATFORM=PM3GENERIC
```

```sh
make clean
make
```

## Update FW
Note as part of the process the device resets, and you need to 'usbipd attach' it from the host before its seen again by Docker

do lsusb to ensure its visible before running a cmd. It should try to connect to /dev/ttyACM0

```
./pm3-flash-bootrom 
./pm3-flash-fullimage
```


# Running
./pm3 --> hw status

