#!/bin/bash

rm -rf Berksfile.lock cookbooks
berks vendor cookbooks
vagrant up master1
vagrant up exec1
