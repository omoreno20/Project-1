#!/bin/bash

free -mh > ~/backups/freemem/free_mem.txt
du -sk / > ~/backups/diskuse/disk_usage.txt
lsof > ~/backups/openlist/open_list.txt
df -k > ~/backups/freedisk/free_disk.txt
