#!/bin/bash

for user in $(cat user.list)
do
# Add new user
useradd -m -c $user $user -s /bin/bash
# Add user to sudo group
usermod -a -G sudo $user
# Default password: username
echo -e "$user\n$user" | passwd $user
# User must change password at first login
passwd -e $user
done
