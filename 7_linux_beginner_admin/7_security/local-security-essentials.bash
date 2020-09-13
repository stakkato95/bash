#!/bin/bash
# Author: Artsiom
# Date: 13/09/2020
# Description: SHow basic cmds to manage local security (limit privileges of users already logged in to the system)
# Modified: 13/09/2020

# mechanisms
# 1 SetUID - executables having a permission flag allowing users to run executable in context of executable’s owner (usually as root, example - ping)
# 2 chroot
# 3 ulimit / cgroup
# 4 chroot

# how to check if an executable is SetUID?
ls -l /usr/bin/mount # -rwsr-xr-x 1 root root
# If the fourth character in the permissions field is s, the application is SetUID.
# If the file’s owner is root, then the application is SetUID root.

# list UID processes running in the system (euser - effective user and ruser - real user are not equal)
ps ax -o pid,euser,ruser,comm | awk '{if ($2 != $3) print}'

# make an executable SetUID
chmod 4755 myprogram && sudo chown root myprogram

# list all SetUID execs
sudo find / -perm -4000 -ls
# list all SetGID execs
sudo find / -perm -2000 -ls

# Security baseline: server should be running the bare minimum it needs to provide the services required of it.

# check current runlevel
runlevel # old style
systemctl get-default # systemd style

# why having other users to run processes? Each application that gives up its root privileges can be assigned another (less privileged) user. This other user typically owns all the application’s files. By having each application that drops privileges use its own user, the risk of a compromised application having access to other application configuration files is mitigated. 

# fork bomb
# while true; do sh -c sh & done

# Discretionary Access Control (DAC) - owner of a res controls which users or groups can access the res
# Mandatory Access Control (MAC) - uses predefined policies to control user and process interactions. restricts level of control that users have over objects that they create

# SELinux terms
# subject - process, user
# object - file, socket
# label - metadata about subject or object
# policy - access permissions for subjects and objects
# SELinux is harder to debug. it requires a file system that supports extended attributes

# AppArmor - SUSE's alternative to SELinux

# should be run periodically to check health state of the server
# ps auxww
# tcpdump
# netstat -an
# df -h
# subscribe to a mailing list of sequrity issues www.securityfocus.com
