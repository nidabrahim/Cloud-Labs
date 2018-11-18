#!/bin/sh


openstack container create povrayContainer
openstack server create --flavor m1.tiny --image centos7 --security-group customSecurityGroup --key-name yonida --user-data povray-userdata.sh  povray-instance



