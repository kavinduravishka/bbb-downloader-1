#!/bin/bash

# Check if we are root
uid=$(id -u)
if [ $uid -ne 0 ]
then 
    echo "Please run as root"
    exit 1
fi

# Install ffmpeg
apt install -y ffmpeg

#create directory to download
read -p 'What do you want to call the downloads folder?' DOWNLOAD
mkdir $DOWNLOAD
cd $DOWNLOAD

#ask server URL
read -p 'What is the server url?' URL

#ask meeting ID
read -p 'What is the meeting ID?' meetingID

#download
wget "https://$URL/presentation/$meetingID/video/webcams.mp4"
wget "https://$URL/presentation/$meetingID/deskshare/deskshare.mp4"

#Merge the recordings
ffmpeg -i webcams.mp4 -i deskshare.mp4 -c copy MEETING-VIDEO.mp4