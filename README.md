## ASA IP Convert

### Introduction

A Bash script to convert a list of CIDR formatted IP addresses to ASA compatible object groups.

### Installation Notes / Prerequisites

Requires ipcalc program.

http://jodies.de/ipcalc

Ubuntu/Debian: apt-get install ipcalc

### Usage

asa_ip_convert.sh IP_list.txt

### Examples

user@host ~ $ cat Test_IP_List.txt 
104.211.163.139/32
40.108.0.0/19
40.108.128.0/17
104.146.0.0/19
168.63.99.250

user@host ~ $ ./asa_ip_convert.sh Test_IP_List.txt 
network-object host 104.211.163.139
network-object 40.108.0.0 255.255.224.0
network-object 40.108.128.0 255.255.128.0
network-object 104.146.0.0 255.255.224.0
network-object host 168.63.99.250

