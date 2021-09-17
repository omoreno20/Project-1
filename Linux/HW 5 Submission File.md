**HW 5**

**Step 1: Create, Extract, Compress, and Manage tar Backup Archives**

1. Command to **extract** the TarDocs.tar archive to the current directory: **tar xvf TarDocs.tar** 
1. Command to **create** the Javaless\_Doc.tar archive from the TarDocs/ directory, while excluding the TarDocs/Documents/Java directory: 				       ﻿**tar --exclude='TarDocs/Documents/Java' -cvf Javaless\_Docs.tar TarDocs**
1. Command to ensure Java/ is not in the new Javaless\_Docs.tar archive: ﻿**tar tvf Javaless\_Docs.tar | grep Java**  

**Critical Analysis Question**

- Why wouldn't you use the options -x and -c at the same time with tar?

**You wouldn’t use them at the same time because the -x option is meant to extract information from files or directories while the -c option creates a new archive, in other words a new tar file.**  

**Step 2: Create, Manage, and Automate Cron Jobs**

1. Cron job for backing up the /var/log/auth.log file: ﻿**0 6 \* \* 3 tar cvfz /auth\_backup.tgz /var/log/auth.log**

**Step 3: Write Basic Bash Scripts**

1. Brace expansion command to create the four subdirectories: ﻿**mkdir -p backups/{freemem,diskuse,openlist,freedisk}**
1. Paste your system.sh script edits below:

﻿**#!/bin/bash**

**free -mh > ~/backups/freemem/free\_mem.txt**

**du -sk / > ~/backups/diskuse/disk\_usage.txt**

**lsof > ~/backups/openlist/open\_list.txt**

**df -k > ~/backups/freedisk/free\_disk.txt**

1. Command to make the system.sh script executable: **chmod +x system.sh** 

**Optional**

- Commands to test the script and confirm its execution: **sudo ./system.sh**

**Bonus**

- Command to copy system to system-wide cron directory: **sudo cp system.sh /etc/cron.weekly**

**Step 4. Manage Log File Sizes**

1. Run sudo nano /etc/logrotate.conf to edit the logrotate configuration file.

Configure a log rotation scheme that backs up authentication messages to the /var/log/auth.log.

1. Add your config file edits below:

﻿**# system-specific logs may be configured here**

**/var/log/auth.log {**

`    `**weekly**

`    `**rotate 7**

`    `**notifempty**

`    `**nocompress**

`    `**missingok**

**}**




**Bonus: Check for Policy and File Violations**

1. Command to verify auditd is active: **sudo systemctl status auditd**
1. Command to set number of retained logs and maximum log file size:
   1. Add the edits made to the configuration file below:

﻿**max\_log\_file = 35**

**num\_logs = 7**

1. Command using auditd to set rules for /etc/shadow, /etc/passwd and /var/log/auth.log:
   1. Add the edits made to the rules file below:

**﻿-w /etc/shadow -p rwa -k hashpass\_audit** 

**-w /etc/passwd -p rwa -k userpass\_audit** 

**-w /var/log/auth.log -p rwa -k authlog\_audit**

1. Command to restart auditd: ﻿**sudo systemctl restart auditd**
1. Command to list all auditd rules:  **sudo auditctl -l**
1. Command to produce an audit report: ﻿**sudo aureport --start this-week**
1. Create a user with sudo useradd attacker and produce an audit report that lists account modifications: **﻿sudo ausearch -ts today -k userpass\_audit**
1. Command to use auditd to watch /var/log/cron: ﻿**sudo auditctl -w /var/log/cron -p wra -k cron\_audit**
1. Command to verify auditd rules: **sudo auditctl -l** 


