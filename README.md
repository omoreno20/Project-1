## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![NETWORK_DIAGRAM](Images/NETWORK_DIAGRAM(2).png) 

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the **file_beat.yml** file may be used to install only certain pieces of it, such as Filebeat.

<pre>
---
- name: Installing and Launch Filebeat
  hosts: webservers
  become: yes
  tasks:
    # Use command module
  - name: Download filebeat .deb file
    command: curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.4.0-amd64.deb

    # Use command module
  - name: Install filebeat .deb
    command: dpkg -i filebeat-7.4.0-amd64.deb

    # Use copy module
  - name: Drop in filebeat.yml
    copy:
      src: /etc/ansible/filebeat-config.yml
      dest: /etc/filebeat/filebeat.yml

    # Use command module
  - name: Enable and Configure System Module
    command: filebeat modules enable system

    # Use command module
  - name: Setup filebeat
    command: filebeat setup

    # Use command module
  - name: Start filebeat service
    command: service filebeat start

    # Use systemd module
  - name: Enable service filebeat on boot
    systemd:
      name: filebeat
      enabled: yes



</pre>

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly **available**, in addition to restricting **access** to the network.
- _TODO: What aspect of security do load balancers protect? What is the advantage of a jump box?_

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the **system logs and system performance**.
- _TODO: What does Filebeat watch for?_
- _TODO: What does Metricbeat record?_

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.9   | Linux            |
| Web-1    |Web Server| 10.0.0.10  | Linux            |                  
| Web-2    |Web Server| 10.0.0.12  | Linux            |                  
| ELK      |Dashboard | 10.2.0.4   | Linux            |                  

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the **jumpserver** machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
<pre>
212.102.33.243
</pre>

Machines within the network can only be accessed by **jumpserver**.
- _TODO: Which machine did you allow to access your ELK VM? What was its IP address?_
Answer: I gave acess to my laptop, <pre>
212.102.33.243
</pre>


A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 |212.102.33.243, 10.0.0/8|
| ELK      | Yes                 |212.102.33.243, 10.0.0/8|                  
| Web      | No                  |10.0.0.9|                       

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because **you can recreate the machine at any time using the same blueprint and you can always check to make sure that the configuration has not changed **.
- _TODO: What is the main advantage of automating configuration with Ansible?_

The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc:
- Increase amount of virtual memory to 262144
- Proceed to install docker.io 
- Then install pip3 and the rest of python3
- Then install the docker python module
- Finally, download and run the ELK container

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![Docker_output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
<pre>
10.0.0.10
10.0.0.12
</pre>

We have installed the following Beats on these machines:
- _TODO: Specify which Beats you successfully installed_
- **filebeat** 
- **metricbeat**

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events:
- **filebeat: Collects log files from a server and forwards them to a central repository. For example, it will gather access logs including log-in failures.**
- metricbeat: **Acquires sets of metrics on a predefined interval from the operating system and services and sends them to Elasticsearch or Logstash.**
- 
### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the **filebeat-playbook.yml** file to **/etc/ansible**.
- Update the **/etc/ansible/hosts** file to include **a target group and set of IP addresses for the playbook to target**.
- Run the playbook, and navigate to **http://20.106.73.78:5601/app/kibana** to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
- _Which URL do you navigate to in order to check that the ELK server is running?


