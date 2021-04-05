server '18.177.76.51', user: 'app', roles: %w{app db web}
set :ssh_options, {
  keys: [ENV.fetch('PRODUCTION_SSH_KEY').to_s],
  forward_agent: true,
  auth_methods: %w[publickey]
}
# keys: '/Users/takayamashunya/.ssh/id_rsa'