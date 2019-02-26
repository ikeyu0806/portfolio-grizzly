# frozen_string_literal: true

server 'grizzly', user: 'grizzly', roles: %w[app db web], my_property: :my_value

set :ssh_options,
    keys: %w[/Users/yuki.ikegaya/.ssh/id_rsa],
    forward_agent: true,
    auth_methods: %w[publickey]
