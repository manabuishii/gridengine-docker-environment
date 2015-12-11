#!/bin/bash

qsub -q default@exec1 -j y  -wd /vagrant/ /vagrant/echo.sh
qsub -q default@exec2 -j y  -wd /vagrant/ /vagrant/echo.sh
qsub -q default -j y -wd /vagrant/ /vagrant/echo.sh
qsub -q default -j y -wd /vagrant/ /vagrant/echo.sh
qsub -q default -j y -wd /vagrant/ /vagrant/echo.sh
qsub -q default -j y -wd /vagrant/ /vagrant/echo.sh
qsub -q default -j y -wd /vagrant/ /vagrant/echo.sh
qsub -q default -j y -wd /vagrant/ /vagrant/echo.sh
qsub -q default -j y -wd /vagrant/ /vagrant/echo.sh
qsub -q default -j y -wd /vagrant/ /vagrant/echo.sh
qsub -q default -j y -wd /vagrant/ /vagrant/echo.sh
qsub -q default -j y -wd /vagrant/ /vagrant/echo.sh
