#!/bin/sh

#Proxy config
export http_proxy=http://proxy.clermont-universite.fr:8080

#openstack install
apt-get -y install python-openstackclient

#openstack config
export OS_AUTH_URL=http://172.20.88.10:5000/v3
export OS_PROJECT_ID=72fe25d80014433f8bc78a734a5be70b
export OS_PROJECT_NAME="yonidabrah"
export OS_USER_DOMAIN_NAME="Default"
export OS_USERNAME="yonidabrah"
export OS_PASSWORD="Ent12345"
export OS_REGION_NAME="RegionOne"
export OS_INTERFACE=public
export OS_IDENTITY_API_VERSION=3

#Test Config
openstack server list

#ImageMagick install
apt-get -y install imagemagick

#Get images from container
openstack container save povrayContainer

#Create GIF file
convert *.png -delay 6 -quality 100 glsbng.gif

#Upload GIF file to povrayContainer
openstack object create povrayContainer glsbng.gif

#Shutdown instance
shutdown

