#
# Cookbook Name:: test-cookbook
# Recipe:: database
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
# include_recipe 'mysql::server'
# include_recipe 'mysql::client'

# mysql2_chef_gem 'default' do
#   gem_version '0.3.17'
#   action :install
# end

# Configure the mysql2 Ruby gem.
mysql2_chef_gem 'default' do
  action :install
end

# Configure the MySQL client.
mysql_client 'default' do
  action :create
end

# Configure the MySQL service.
mysql_service 'default' do
  initial_root_password node['mysql']['password']
  action [:create, :start]
end

mysql_connection_info = {
  :host => node['mysql']['host'],
  :username => node['mysql']['username'],
  :password => node['mysql']['password']
}

mysql_database node['mysql']['dbname'] do
  connection mysql_connection_info
  action :create
end

# Add a database user.
mysql_database_user node['mysql']['app']['username'] do
  connection(
    :host => node['mysql']['host'],
    :username => node['mysql']['username'],
    :password => node['mysql']['password']
  )
  password node['mysql']['app']['password']
  database_name node['mysql']['dbname']
  host node['mysql']['host']
  action [:create, :grant]
end

# Seed the database with a table and test data.
execute 'initialize database' do
  command "mysql -h #{node['mysql']['host']} -u #{node['mysql']['app']['username']} -p#{node['mysql']['app']['password']} -D #{node['mysql']['dbname']} < #{node['mysql']['app']['seed_file']}"
  not_if  "mysql -h #{node['mysql']['host']} -u #{node['mysql']['app']['username']} -p#{node['mysql']['app']['password']} -D #{node['mysql']['dbname']} -e 'describe wp_users;'"
end