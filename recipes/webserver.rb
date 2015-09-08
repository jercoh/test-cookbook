#
# Cookbook Name:: test-cookbook
# Recipe:: webserver
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'nginx'

# cookbook_file "#{node['nginx']['dir']}/sites-available/stag.thebeautyst.org" do
#   mode '0644'
# end

cookbook_file "#{node['nginx']['dir']}/sites-available/stag.thebeautyst.org" do
  source 'nginx/stag.thebeautyst.org'
  mode '0644'
end

nginx_site 'stag.thebeautyst.org'