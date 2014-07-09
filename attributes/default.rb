default['nginx']['passenger']['port'] = 8080
# use override as this is a wrapper cookbook
override['nginx']['source']['modules'] = ["nginx::passenger", "http_stub_status_module", "http_ssl_module", "http_gzip_static_module"]