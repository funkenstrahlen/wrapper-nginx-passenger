#
# Cookbook Name:: wrapper-nginx-passenger
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

apt_repository 'nginx-passenger' do
  uri          'https://oss-binaries.phusionpassenger.com/apt/passenger'
  distribution node['lsb']['codename']
  components   ['main']
  keyserver    'keyserver.ubuntu.com'
  key          '561F9B9CAC40B2F7'
end

# install nginx which contains passenger support
package "nginx-extras"
package "passenger"

# define nginx service as the nginx::passenger recipe restarts the service
# and fails if the service does not exist
service 'nginx' do
  supports :status => true, :restart => true, :reload => true
  action   :start
end

# installs the passenger gem
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