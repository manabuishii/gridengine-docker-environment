# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  #config.vm.box = "opscode-ubuntu-14.04"
  config.vm.box = "bento/ubuntu-14.04"
  if Vagrant.has_plugin?("vagrant-omnibus")
    config.omnibus.chef_version = :latest
  end
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
  config.hostmanager.enabled = true
  config.chef_zero.chef_repo_path = "."
  config.hostmanager.include_offline = true
  config.vm.define :master1 do | master1 |
    master1.vm.hostname = "master1.devops.test"
    master1.vm.network :private_network, ip: "192.168.33.10", virtualbox__intnet: "intnet"
    master1.hostmanager.aliases = %w(master1)
    config.vm.provision "shell", inline: "hostname master1.devops.test"
    config.vm.provision :chef_client do |chef|

      chef.custom_config_path = "chef_custom_config"
      chef.run_list = [
        #"ubuntu-change-source-list"
        "ubuntu-change-source-list","apt","localsetup","timezone-ii","gengine"
        #"localsetup"
      ]
      chef.json = {
        :localsetup => {
          :hostname=>"master1.devops.test"
        },
        :ubuntu => {
          :mirror_site_url => "http://ftp.jaist.ac.jp/pub/Linux/ubuntu/",
          :version => "14.04",
          :need_deb_src => false,
          :need_update => true
        },
        :gengine=>{
          :role=> "master",
          :host_groups=>{
            :default=>{
              #:nodes=>[ "master1.devops.test", "exec1.devops.test", "exec2.devops.test", "exec3.devops.test" ]
              :nodes=>[ "master1.devops.test", "exec1.devops.test", "exec2.devops.test" ]
            }
          },
          :complex_values=>{
            #
            "qname" => "q          RESTRING    ==    YES          NO         NONE     0"
          },
          :queues=>{
            :default=>{
              :hostlist=> "@default"
            }
          }
        },
          :tz=>"Asia/Tokyo"

      }
    end
    #web.vm.network :private_network, ip: "192.168.33.10"
  end

  config.vm.define :exec1 do | exec1 |
    exec1.vm.hostname = "exec1.devops.test"
    exec1.vm.network :private_network, ip: "192.168.33.20", virtualbox__intnet: "intnet"
    exec1.hostmanager.aliases = %w(exec1)
    #config.vm.provision "shell", inline: "hostname exec1.devops.test"
    config.vm.provision :chef_client do |chef|
      chef.custom_config_path = "chef_custom_config"
      chef.run_list = [
        "ubuntu-change-source-list","apt","localsetup","timezone-ii","gengine"
      ]
      chef.json = {
        :localsetup => {
          :hostname=>"exec1.devops.test"
        },
        :ubuntu => {
          :mirror_site_url => "http://ftp.jaist.ac.jp/pub/Linux/ubuntu/",
          :version => "14.04",
          :need_deb_src => false,
          :need_update => true
        },
        :gengine=>{
          :master=> "master1.devops.test"
        },
          :tz=>"Asia/Tokyo"
      }
    end
  end
  config.vm.define :exec2, autostart: false  do | exec2 |
    exec2.vm.hostname = "exec2.devops.test"
    exec2.vm.network :private_network, ip: "192.168.33.22", virtualbox__intnet: "intnet"
    exec2.hostmanager.aliases = %w(exec2)
    #config.vm.provision "shell", inline: "hostname exec2.devops.test"
    config.vm.provision :chef_client do |chef|
      chef.custom_config_path = "chef_custom_config"
      chef.run_list = [
        "ubuntu-change-source-list","apt","localsetup","timezone-ii","gengine"
      ]
      chef.json = {
        :localsetup => {
          :hostname=>"exec2.devops.test"
        },

        :ubuntu => {
          :mirror_site_url => "http://ftp.jaist.ac.jp/pub/Linux/ubuntu/",
          :version => "14.04",
          :need_deb_src => false,
          :need_update => true
        },
        :gengine=>{
          :master=> "master1.devops.test"
        },
          :tz=>"Asia/Tokyo"
      }
    end
  end
  # config.vm.define :exec3 , autostart: false do | exec3 |
  #   exec3.vm.hostname = "exec3.devops.test"
  #   exec3.vm.network :private_network, ip: "192.168.33.23", virtualbox__intnet: "intnet"
  #   exec3.hostmanager.aliases = %w(exec3)
  #   config.vm.provision "shell", inline: "hostname exec3.devops.test"
  #   config.vm.provision :chef_client do |chef|
  #     chef.custom_config_path = "chef_custom_config"
  #     chef.run_list = [
  #       "ubuntu-change-source-list","apt","localsetup","timezone-ii","gengine"
  #     ]
  #     chef.json = {
  #       :ubuntu => {
  #         :mirror_site_url => "http://ftp.jaist.ac.jp/pub/Linux/ubuntu/",
  #         :version => "14.04",
  #         :need_deb_src => false,
  #         :need_update => true
  #       },
  #       :gengine=>{
  #         :master=> "master1.devops.test"
  #       },
  #         :tz=>"Asia/Tokyo"
  #     }
  #   end
  # end

end
