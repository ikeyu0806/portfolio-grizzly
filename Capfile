# frozen_string_literal: true

require 'capistrano/setup'

require 'capistrano/deploy'

require 'capistrano/scm/git'
install_plugin Capistrano::SCM::Git

require 'capistrano/rbenv'
set :rbenv_type, :user
set :rbenv_ruby, '2.5.1'

require 'capistrano/bundler'

require 'capistrano3/unicorn'

Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
