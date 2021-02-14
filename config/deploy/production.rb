server '18.177.76.51', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/takayamashunya/.ssh/id_rsa'