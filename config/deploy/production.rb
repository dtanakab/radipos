# frozen_string_literal: true

server "radipos.site", user: "dtanakab", roles: %w{app web db}

set :ssh_options, {
  keys: %w(~/.ssh/id_rsa_3a93b4ea710ae0b5c2731e3a97d3275f),
  port: 59191,
  forward_agent: true,
  auth_methods: %w(publickey)
}
