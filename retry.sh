#!/bin/bash
vagrant destroy -f
rm -rf cookbooks Berksfile.lock
berks vendor cookbooks
vagrant up zabbix
