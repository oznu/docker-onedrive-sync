#!/bin/bash

echo "Here!"

if [ -f $HOME/onedrive.conf ]
then
  cp -f $HOME/.config/onedrive.conf $HOME/.config/onedrive_backup.conf
fi

if [ -f /usr/local/etc/my_onedrive.conf ]
then
  cp -f /usr/local/etc/my_onedrive.conf $HOME/.config/onedrive.conf
fi

exec "$@"
