#
# Cookbook Name:: test-cookbook
# Recipe:: webserver
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'nginx'

cookbook_file "#{node['nginx']['dir']}/sites-available/stag.thebeautyst.org" do
  source 'nginx/stag.thebeautyst.org'
  mode '0644'
end

nginx_site 'stag.thebeautyst.org'

cookbook_file "#{node['nginx']['dir']}/sites-available/phpmyadmin" do
  source 'nginx/phpmyadmin'
  mode '0644'
end

nginx_site 'phpmyadmin'

hostsfile_entry '127.0.0.1' do
  hostname  'stag.thebeautyst.org stag-fr.thebeautyst.org'
  action    :create
end