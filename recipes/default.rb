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
  group node['thebeautyst']['group']
  system true
  shell '/bin/bash'
end

include_recipe 'test-cookbook::webserver'