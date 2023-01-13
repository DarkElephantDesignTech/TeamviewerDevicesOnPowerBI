# TeamviewerDevicesOnPowerBI
An easy to edit script to connect PowerBI (or Excel, using PowerQuery) to Teamviewer API.  

I wanted to link my Teamviewer Monitoring Management information to run analysis on PowerBI and realized it is a complete PITA to do this (for a noob like myself). You can't make a call to get all devices. You will need to first get the device list, then issue a GET command for each device with its unique ID. I've done all that and I'm publishing a noob-proof editable version 

I enlisted some help from ChatGPT to figure out how to iterate through the list of Device IDs, spent some time getting it to work and optimizing, then added variables that can be edited easily to bring the following to PowerBI:

-Device information
-Hardware 
-Software

Simply copy/paste the code in "Advanced Editor" and follow the comments to enter your API Key and choose the information you're trying to get.

If you are just looking for a starting point to pull from Teamviewer API or just want to run a quick analysis of your hardware, installed software etc, This script is for you, and you're welcome. 
