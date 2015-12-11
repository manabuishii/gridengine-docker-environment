howto

vagrant up zabbix
vagrant up web

```
$ cat dockertest.sh
docker run hello-world
```

```
qsub -j y  -wd /vagrant dockertest.sh
qsub -j y -o /vagrant/job.log -wd /vagrant docker-run-job.sh
```
新しくキューを作る
```
$ sudo qconf -aq aaa
```

キューを指定して投げようとするとエラー
```
$ qsub -q aaa  dockertest.sh
Unable to run job: Job was rejected because job requests a queue while queues are not configured as requestable.
Exiting.
```
直すために
```
sudo qconf -mc
```
qnameのrequestableをyesにする

```
qsub -q default@exec1 -j y  -wd /vagrant /vagrant/echo.sh
qsub -q default@exec2 -j y  -wd /vagrant /vagrant/echo.sh
qsub -q default -j y  -wd /vagrant /vagrant/echo.sh
qsub -q default -j y  -wd /vagrant /vagrant/echo.sh
qsub -q default -j y  -wd /vagrant /vagrant/echo.sh
qsub -q default -j y  -wd /vagrant /vagrant/echo.sh
```

```
/vagrant/throw_echo_job_by_qsub.sh
```

```
vagrant@master1:~$ /vagrant/throw_echo_job_by_qsub.sh
Your job 1 ("echo.sh") has been submitted
Your job 2 ("echo.sh") has been submitted
Your job 3 ("echo.sh") has been submitted
Your job 4 ("echo.sh") has been submitted
Your job 5 ("echo.sh") has been submitted
Your job 6 ("echo.sh") has been submitted
Your job 7 ("echo.sh") has been submitted
Your job 8 ("echo.sh") has been submitted
Your job 9 ("echo.sh") has been submitted
Your job 10 ("echo.sh") has been submitted
Your job 11 ("echo.sh") has been submitted
Your job 12 ("echo.sh") has been submitted
```

```
vagrant@master1:~$ head -n 1 /vagrant/echo.sh.o*
==> /vagrant/echo.sh.o1 <==
vagrant@exec1.devops.test:/vagrant/

==> /vagrant/echo.sh.o10 <==
vagrant@exec2.devops.test:/vagrant/

==> /vagrant/echo.sh.o11 <==
vagrant@exec1.devops.test:/vagrant/

==> /vagrant/echo.sh.o12 <==
vagrant@exec2.devops.test:/vagrant/

==> /vagrant/echo.sh.o2 <==
vagrant@exec2.devops.test:/vagrant/

==> /vagrant/echo.sh.o3 <==
vagrant@exec1.devops.test:/vagrant/

==> /vagrant/echo.sh.o4 <==
vagrant@exec2.devops.test:/vagrant/

==> /vagrant/echo.sh.o5 <==
vagrant@exec1.devops.test:/vagrant/

==> /vagrant/echo.sh.o6 <==
vagrant@exec2.devops.test:/vagrant/

==> /vagrant/echo.sh.o7 <==
vagrant@exec1.devops.test:/vagrant/

==> /vagrant/echo.sh.o8 <==
vagrant@exec2.devops.test:/vagrant/

==> /vagrant/echo.sh.o9 <==
vagrant@exec1.devops.test:/vagrant/
```
