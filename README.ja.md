# 必要なもの

vagrantのpluginでホスト名をうまく解決してくれるやつ
* [vagrant-hostmanager](https://github.com/jyokyoku/vagrant-hostmanager)
* [vagrant-cachier](https://github.com/fgrehm/vagrant-cachier)

## chef-zero

試した時は

|software|version|
| ---- | ---- |
|vagrant-chef-zero|1.0.1|
|chef-zero|4.3.2|

# cache とか

|software|version|
| ---- | ---- |
|vagrant-cachier|1.2.1|
|vagrant-omnibus|1.4.1|

```
if Vagrant.has_plugin?("vagrant-omnibus")
  config.omnibus.chef_version = :latest
end
```

# TODO
[ ] apt
[ ] ubuntu-change-source-list
[ ] gengine
[ ] clustering
[ ] test

# 起動

```
vagrant up
```

# 確認

```
$ vagrant ssh zabbix

Welcome to Ubuntu 14.04 LTS (GNU/Linux 3.13.0-24-generic x86_64)

 * Documentation:  https://help.ubuntu.com/
Last login: Sat Apr 19 05:27:17 2014 from 10.0.2.2
vagrant@zabbix:~$ ping web
PING web (192.168.33.10) 56(84) bytes of data.
64 bytes from web (192.168.33.10): icmp_seq=1 ttl=64 time=0.476 ms
64 bytes from web (192.168.33.10): icmp_seq=2 ttl=64 time=0.366 ms
^C
--- web ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1000ms
rtt min/avg/max/mdev = 0.366/0.421/0.476/0.055 ms
vagrant@zabbix:~$ cat /etc/hosts
127.0.0.1	localhost
127.0.1.1 zabbix zabbix

# The following lines are desirable for IPv6 capable hosts
::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters

## vagrant-hostmanager-start
192.168.33.10	web

192.168.33.20	zabbix

## vagrant-hostmanager-end
```
# error

```
There are errors in the configuration of this machine. Please fix
the following errors and try again:

chef client provisioner:
* Chef Server URL must be populated.
* Validation key path must be valid path to your Chef Server validation key.
```
これが出た時は、

chef_custom_config というファイルに以下の中身を書いて

```
Chef::Config.ssl_verify_mode = :verify_peer
```
Vagrantfileの中のprovisionの中に次のようなものを書いておく

```
config.vm.provision :chef_client do |chef|
  chef.custom_config_path = "chef_custom_config"
```

これで解決するかと思ったがそうでもないようだ。。

```
gem list | grep chef-zero
chef-zero (2.0.2)
```

```
gem install chef-zero
```

```
gem list | grep chef-zero
chef-zero (4.3.2, 2.0.2)
```


# berkshelf
```
berks vendor cookbooks
```


# FQDN

https://github.com/mitchellh/vagrant/issues/3271


Another workaround is to make the hostname change part of your provisioning shell script. Inline example:

Vagrant.configure("2") do |config|
  config.vm.provision "shell", inline: "hostname app.example.com"
end


http://markmail.org/thread/k6ohon3daqzoghbg#query:+page:1+mid:eobw2jyzzpb4lewe+state:results

 During installation yof SGE ou can configure SGE to use the FQDN or only the hostname. Maybe it's related to this.


# test kitchen

マシンを起動する

```
kitchen converge master1-ubuntu-1404
kitchen converge exec1-ubuntu-1404
kitchen converge exec2-ubuntu-1404
```

テストする

```
kitchen veriry master1-ubuntu-1404
```
