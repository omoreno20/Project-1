#!/bin/bash

tar cvf /var/backups/home.tar /home 
mv /var/backups/home.tar /var/backups/home.07142021.tar
ls -lh /var/backups > /var/backups/file_report.txt 
free -h >> /var/backups/file_report.txt 
