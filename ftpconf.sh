#!/bin/bash
if [ "$(id -u)" != 0 ]; then
  echo "This script must be run as root. 'sudo bash $0'"
  exit 1
fi
FILE="/etc/vsftpd/vsftpd.conf"
if [ -e $FILE ]
then
  sed -i "s/anonymous_enable=YES/anonymous_enable=NO/g" $FILE
  sed -i "s/#anonymous_enable/anonymous_enable/" $FILE
  sed -i "s/local_enable=NO/local_enable=YES/g" $FILE
  sed -i "s/#local_enable/local_enable/" $FILE
  sed -i "s/chroot_local_user=NO/chroot_local_user=YES/g" $FILE
  sed -i "s/#chroot_local_user/chroot_local_user/" $FILE
  service vsftpd restart
else
  echo "Couldn't find Vsftpd configure directory. Exiting.."
  exit
fi

