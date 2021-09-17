**Week 4 Homework Submission File: Linux Systems Administration**

**Step 1: Ensure/Double Check Permissions on Sensitive Files**

1. Permissions on /etc/shadow should allow only root read and write access.
   1. Command to inspect permissions: **ls -l shadow**
   1. Command to set permissions (if needed): **sudo chmod 600 shadow** 
1. Permissions on /etc/gshadow should allow only root read and write access.
   1. Command to inspect permissions: **ls -l gshadow**
   1. Command to set permissions (if needed): **sudo chmod 600 gshadow**
1. Permissions on /etc/group should allow root read and write access and allow everyone else read access only.
   1. Command to inspect permissions: **ls -l group**
   1. Command to set permissions (if needed): **None needed**
1. Permissions on /etc/passwd should allow root read and write access and allow everyone else read access only.
   1. Command to inspect permissions: **ls -l passwd**
   1. Command to set permissions (if needed): **None needed**

**Step 2: Create User Accounts**

1. Add user accounts for sam, joe, amy, sara, and admin.
   1. Command to add each user account (include all five users):

**sudo useradd sam** 

**sudo useradd joe**

**sudo useradd amy**

**sudo useradd sara**

**sudo useradd admin**

1. Ensure that only the admin has general sudo access.
   1. Command to add admin to the sudo group: **sudo usermod -aG sudo amdin**

**Step 3: Create User Group and Collaborative Folder**

1. Add an engineers group to the system.
   1. Command to add group: **sudo groupadd engineers**
1. Add users sam, joe, amy, and sara to the managed group.
   1. Command to add users to engineers group (include all four users):

**sudo usermod -aG engineers sam**

**sudo usermod -aG engineers joe**

**sudo usermod -aG engineers amy**

**sudo usermod -aG engineers sara**

1. Create a shared folder for this group at /home/engineers.
   1. Command to create the shared folder: **sudo mkdir /home/engineers**
1. Change ownership on the new engineers' shared folder to the engineers group.
   1. Command to change ownership of engineer's shared folder to engineer group: **sudo chgrp engineers /home/engineers**










**Step 4: Lynis Auditing**

1. Command to install Lynis: **apt install lynis**
1. Command to see documentation and instructions: **man lynis**
1. Command to run an audit: **sudo lynis audit system**
1. Provide a report from the Lynis output on what can be done to harden the system.

**The report suggests that parts of Lynis should be updated to the latest version to prevent cybercriminals from taking advantage of current vulnerabilities. Additionally, password authentication needs to be improved and updated and since multiple users have access, one needs to consider which users should maintain access and which should have their access restricted. Furthermore, some Lynis passwords need to be updated or modified.**

1. **Screenshot of report output:**


































