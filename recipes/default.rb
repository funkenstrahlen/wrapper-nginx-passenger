#
# Cookbook Name:: wrapper-nginx-passenger
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

# install ruby
include_recipe "ruby_build"
ruby_build_ruby "#{node[:ruby][:version]}"

# compile nginx with passenger support
include_recipe "nginx::source"
include_recipe "nginx::passenger"

# create server config template in nginx config directory
template "/etc/nginx/sites-available/plantasy" do
  source "plantasy.erb"
  mode 0644
  owner "root"
  group "root"
end

# symlink the config to the active sites directory
link "/etc/nginx/sites-enabled/plantasy" do
  to "/etc/nginx/sites-available/plantasy"
end