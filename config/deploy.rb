# frozen_string_literal: true

lock '~> 3.11.0'

set :application, 'grizzly'

set :repo_url, 'git@github.com:naviplus-asp/grizzly.git'
set :branch, 'deploy_setting'
set :deploy_to, '/var/www/grizzly'
set :pty, true

set :rbenv_type, :user
set :rbenv_ruby, '2.5.1'
set :rbenv_path, '/home/grizzly/.rbenv'
set :bundle_path, -> { shared_path.join('bundle') }
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w[rake gem bundle ruby rails]

set :rails_env, 'production'

append :linked_files, 'config/master.key', 'config/database.yml'
append :linked_dirs, '.bundle', 'tmp/pids', 'tmp/sockets'

set :unicorn_pid, -> { '/var/www/grizzly/shared/tmp/pids/unicorn.grizzly.pid' }
set :unicorn_config_path, 'config/unicorn/production.rb'

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end
  desc 'Upload database.yml'
  task :upload do
    on roles(:app) do |host|
      if test "[ ! -d #{shared_path}/config ]"
        execute "mkdir -p #{shared_path}/config"
      end
      upload!('config/database.yml', "#{shared_path}/config/database.yml")
    end
  end
end
