# frozen_string_literal: true

server '192.168.33.40', user: 'grizzly', roles: %w[app db web], my_property: :my_value

set :ssh_options,
    keys: %w[/home/rlisowski/.ssh/id_rsa],
    forward_agent: false,
    auth_methods: %w[password]
