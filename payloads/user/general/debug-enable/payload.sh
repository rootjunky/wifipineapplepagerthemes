#!/bin/bash
# Title: Enable Privacy Mode
sed -i 's/"censor": false/"censor": true/g' /usr/debug.json
LOG "Please reboot for privacy mode to take effect"
