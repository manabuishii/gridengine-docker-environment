#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
hostsfile_entry '127.0.1.1' do
  action :remove
end
bash "setuphostname" do
  code "hostname #{node.localsetup.hostname}"
  action :run
end
docker_installation_script 'default' do
  repo 'main'
  #script_url 'https://my.computers.biz/dist/scripts/docker.sh'
  script_url 'http://get.docker.com/'
  action :create
  notifies :modify, "group[docker]"
end

group 'docker' do
  action :nothing
  members 'vagrant'
  append true
end
