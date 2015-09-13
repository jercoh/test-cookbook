#
# Cookbook Name:: test-cookbook
# Recipe:: webserver
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'nginx'
include_recipe "php"
include_recipe "php::module_mysql"
include_recipe "php::module_apc"
include_recipe "php::module_curl"


# Nginx Config
# ensure!
nginx_site 'default' do
  enable false
end

nginx_site 'stag.thebeautyst.org' do
    template 'stag.thebeautyst.org.erb'
end

nginx_site 'phpmyadmin' do
    template 'phpmyadmin.erb'
end

hostsfile_entry '127.0.0.1' do
  hostname  'stag.thebeautyst.org stag-fr.thebeautyst.org'
  action    :create
end


# Install phpmyadmin
cookbook_file "/tmp/phpmyadmin.deb.conf" do
  source "phpmyadmin/phpmyadmin.deb.conf"
end
bash "debconf_for_phpmyadmin" do
  code "debconf-set-selections /tmp/phpmyadmin.deb.conf"
end
package "phpmyadmin"

package "php5-fpm" do
  action :install
end