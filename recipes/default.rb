#
# Cookbook Name:: wrapper-nginx-passenger
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

include_recipe "nginx::source"
include_recipe "nginx::passenger"

# this has to be done to overwrite the template of the nginx cookbook
begin
  t = resources(:template => "/etc/init/nginx.conf")
  t.source "nginx.conf.erb"
  t.cookbook "wrapper-nginx-passenger"
  rescue Chef::Exceptions::ResourceNotFound
    Chef::Log.warn "could not find template for nginx.conf.erb to modify"
end
