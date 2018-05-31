#/bin/bash

# unset any variable which system may be using

# clear the screen
clear

unset tecreset os architecture kernelrelease internalip externalip nameserver loadaverage cpua cpus cpuc cput cpum os setl manf hostidofvm dspace ram

# Define Variable tecreset
tecreset=$(tput sgr0)

# Check if connected to Internet or not
ping -c 1 google.com &> /dev/null && echo -e '\E[32m'"Internet: $tecreset Connected" || echo -e '\E[32m'"Internet: $tecreset Disconnected"

# Check hostname
echo -e '\E[32m'"Hostname :" $tecreset $HOSTNAME

# Check HostID
hostidofvm=$(hostid)
echo -e '\E[32m'"HostID :" $tecreset $hostidofvm

# Check Manifacturer and Model ID
manf=$(dmidecode | grep -A3 '^System Information')
echo -e '\E[32m'"Manifacturer :" $tecreset $manf

# Check Serial Number
serl=$(dmidecode | grep -i serial  | head -3)
echo -e '\E[32m'"Serial Number is :" $tecreset $serl

# Check Internal IP
internalip=$(hostname -I)
echo -e '\E[32m'"Internal IP :" $tecreset $internalip

# Check External IP
externalip=$(curl -s ipecho.net/plain;echo)
echo -e '\E[32m'"External IP : $tecreset "$externalip

# Check OS
os=$(uname -o)
echo -e '\E[32m'"OS is :" $tecreset $os

# Check OS Release Version and Name
osversion=$(cat /etc/redhat-release)
echo -e '\E[32m'"OS Version is :" $tecreset $osversion
#cat /etc/redhat-release | grep 'NAME\|VERSION' | grep -v 'VERSION_ID' | grep -v 'PRETTY_NAME' > /tmp/osrelease
#echo -n -e '\E[32m'"OS Name :" $tecreset  && cat /tmp/osrelease | grep -v "VERSION" | cut -f2 -d\"
#echo -n -e '\E[32m'"OS Version :" $tecreset && cat /tmp/osrelease | grep -v "NAME" | cut -f2 -d\"


# Check Architecture
architecture=$(uname -m)
echo -e '\E[32m'"Architecture :" $tecreset $architecture

# Check Kernel Release or  Service Pack
kernelrelease=$(uname -r)
echo -e '\E[32m'"Kernel Release(Service Pack) :" $tecreset $kernelrelease


# Check DNS
nameservers=$(cat /etc/resolv.conf | sed '1 d' | awk '{print $2}')
echo -e '\E[32m'"Name Servers :" $tecreset $nameservers

# Check RAM and SWAP Usages
#free -h | grep -v + > /tmp/ramcache
#echo -e '\E[32m'"Ram Usages :" $tecreset
#cat /tmp/ramcache | grep -v "Swap"
#echo -e '\E[32m'"Swap Usages :" $tecreset
#cat /tmp/ramcache | grep -v "Mem"


free -m | awk '{print $2}' | head -2 | tail -1

# Check RAM
ram=$(free -m | awk '{print $2}' | head -2 | tail -1)
echo -e '\E[32m'"CPU Manifacturer :" $tecreset $ram


# Check CPU Manifacturer
cpum=$(cat /proc/cpuinfo | grep vendor | uniq)
echo -e '\E[32m'"CPU Manifacturer :" $tecreset $cpum


# Check CPU Type
cput=$(cat /proc/cpuinfo | grep 'model name' | uniq)
echo -e '\E[32m'"CPU Type :" $tecreset $cput

# Check CPU Count
cpuc=$(grep -c ^processor /proc/cpuinfo)
echo -e '\E[32m'"CPU Count :" $tecreset $cpuc

# Check CPU Speed
cpus=$(lscpu | grep -i mhz)
echo -e '\E[32m'"CPU Speed :" $tecreset $cpus

# Check CPU Architecture
cpua=$(lscpu)
echo -e '\E[32m'" CPU Architecture :" $tecreset $cpua

# Disk Space
size=$(fdisk -l | grep sd | grep Disk | awk '{print $5}' | awk '{sum += $1} END {print sum}')
dspace=$(expr $size / 1073741824)
echo -e '\E[32m'" Disk Space in GB :" $tecreset $dspace

# Unset Variables
unset tecreset os architecture kernelrelease internalip externalip nameserver loadaverage cpua cpus cpuc cput cpum os setl manf hostidofvm dspace ram
