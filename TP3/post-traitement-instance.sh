#!/bin/sh


openstack server create --flavor m1.tiny --image centos7-xenial --security-group customSecurityGroup --key-name yonida --user-data post-userdata.sh post-traitement

