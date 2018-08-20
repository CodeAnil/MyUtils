#!/bin/bash
# Script to add a user to Linux system
echo $1
echo $2
echo $3
#if [ $(id -u) -eq 0 ]; then
        #read -p "Enter username : " username
        #read -s -p "Enter password : " password
        username=$1;
        password=$2;
        fullname=$3
        echo $fullname

        egrep "^$username" /etc/passwd >/dev/null
        if [ $? -eq 0 ]; then
                echo "$username exists!"
                exit 1
        else
                echo "About to create user "
                pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
                useradd  -b /home -c "$fullname" -s "/bin/bash" -p $pass $username
                [ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"
        fi
#else
        echo "Only root may add a user to the system"
        exit 2

#fi
