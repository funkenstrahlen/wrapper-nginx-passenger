default['nginx']['passenger']['port'] = 8080
# use override as this is a wrapper cookbook
override['nginx']['source']['modules'] = ["nginx::passenger"]
default['ruby']['version'] = '2.1.2'