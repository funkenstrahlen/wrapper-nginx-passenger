#
# Cookbook Name:: wrapper-nginx-passenger
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

include_recipe "nginx::source"
include_recipe "nginx::passenger"

template "/etc/nginx/sites-enabled/plantasy" do
  source "templates/default/plantasy.erb"
  mode 0644
  owner "root"
  group "root"
end