# frozen_string_literal: true

server '118.27.33.70', user: 'grizzly', roles: %w[app db web], my_property: :my_value

set :ssh_options,
    keys: %w[~/.ssh/id_rsa],
    forward_agent: true,
    auth_methods: %w[publickey]
