#
# Cookbook Name:: wrapper-nginx-passenger
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

# force settings of $PATH to ensure working passenger compilation
execute "set ruby version to #{node[:rvm][:default_ruby]}" do
 code <<EOH
  source "/etc/profile.d/rvm.sh"
  rvm use "#{node[:rvm][:default_ruby]}"
 <<EOH
  action :nothing
end

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