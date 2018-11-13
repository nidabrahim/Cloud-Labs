#!/bin/sh

#Proxy config
export http_proxy=http://proxy.clermont-universite.fr:8080

#openstack intall
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

#Getting zzpovray.tar.gz from container
openstack object save povrayContainer zzpovray.tar.gz

#Extracting povray
tar xfv zzpovray.tar.gz
ls -l
cd povray

#Creating images
./povray +A +W800 +H600 +Lshare/povray-3.6/include/ +SF1 +EF80  glsbng.ini

#uploading images to container
openstack object create povrayContainer *.png

#Shutdown instance
shutdown

