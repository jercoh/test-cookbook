#
# Cookbook Name:: test-cookbook
# Recipe:: setup
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

package ['curl', 'emacs', 'ruby-all-dev'] do 
  action :install
end
