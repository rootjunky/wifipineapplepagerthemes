#!/bin/bash
# Title: nmap top ports 100
# Description: simple port scan
# Author: RootJunky
# Version: 1

ip=$(IP_PICKER "Nmap scan enter IP" "192.168.1.1")
LOG "$ip ready for scan"
LOG "Scan in progress please wait"
ports=$(nmap --top-ports 100 "$ip")
LOG "$ports"
LOG "Please scroll up to view results"
