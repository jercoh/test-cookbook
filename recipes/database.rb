#
# Cookbook Name:: test-cookbook
# Recipe:: database
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'mysql::server'
include_recipe 'mysql::client'