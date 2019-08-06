Convert CIDR
=========

How to use
------------
* clone script
* add network in IN_ADDRESS= like as example 
* run and get OpenVPN format

Example
------------
* Input data:
```
192.168.1.0/24
192.168.33.0/22
8.8.8.8/32
```
**Server IP:** 192.168.1.1
* Output Data Format:
```
push "route 192.168.1.0 255.255.255.0 192.168.1.1"
push "route 192.168.33.0 255.255.252.0 192.168.1.1"
push "route 8.8.8.8 255.255.255.255 192.168.1.1"
```