#!/bin/bash
#Title: GPS location
#Description: Get your location
#Author: Rootjunky
#Version: 1


GPS_OUTPUT=$(GPS_LIST)
LOG "$GPS_OUTPUT"

GPS_LOCATION=$(GPS_GET)
LOG "Your location is $GPS_LOCATION"