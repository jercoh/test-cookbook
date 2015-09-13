#
# Cookbook Name:: test-cookbook
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'test-cookbook::setup'
include_recipe 'test-cookbook::webserver'
include_recipe 'test-cookbook::database'

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
  recursive true
  owner 'www-data'
  group 'www-data'
  mode '0755'
  action :create
end

directory '/usr/share/nginx/html' do
  owner 'www-data'
  group 'www-data'
  mode '0755'
  action :create
end

# directory '/usr/share/phpmyadmin' do
#   owner 'www-data'
#   group 'www-data'
#   mode '0755'
#   action :create
# end

execute "chown-data-www" do
  command "chown -R www-data:www-data /usr/share/phpmyadmin"
  action :run
end

directory '/var/log/thebeautyst' do
  owner 'www-data'
  group 'www-data'
  mode '0755'
  action :create
end