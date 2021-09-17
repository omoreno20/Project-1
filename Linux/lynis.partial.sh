#!/bin/bash

lynis --tests "malware authentication networking storage filesystems" > /tmp/lynis.partial_scan.log
