#
# Cookbook Name:: test-cookbook
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

group node['thebeautyst']['group']

user node['thebeautyst']['user'] do
  group node['thebeautyst']['group'].to_i 
  system true
  shell '/bin/bash'
end

user node['thebeautyst']['group'] do
  group node['thebeautyst']['user'].to_i 
  system true
  shell '/bin/bash'
end

directory '/var/www' do
  owner 'www-data'
  group 'www-data'
  mode '0775'
  action :create
end

directory '/var/log/thebeautyst' do
  owner 'www-data'
  group 'www-data'
  mode '0775'
  action :create
end

include_recipe 'test-cookbook::webserver'
include_recipe 'test-cookbook::database'