#!/bin/bash
vagrant destroy -f
rm -rf Berksfile.lock cookbooks
berks vendor cookbooks
vagrant up master1
