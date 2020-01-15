# frozen_string_literal: true

server "radipos.site", user: "dtanakab", roles: %w{app web db}

set :ssh_options, {
  keys: %w(~/.ssh/id_rsa),
  port: 59191,
  forward_agent: true,
  auth_methods: %w(publickey)
}
