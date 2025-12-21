#!/bin/bash
# Title: Disable Privacy Mode
sed -i 's/"censor": true/"censor": false/g' /usr/debug.json
LOG "Please reboot for privacy mode to be disabled"
