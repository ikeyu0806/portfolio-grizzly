# frozen_string_literal: true

lock '~> 3.11.0'

set :application, 'grizzly'

set :repo_url, 'git@github.com:naviplus-asp/grizzly.git'
set :branch, 'master'
set :deploy_to, '/var/www/grizzly'
set :pty, true

set :rbenv_type, :user
set :rbenv_ruby, '2.5.1'
set :rbenv_path, '/home/grizzly/.rbenv'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w[rake gem bundle ruby rails]

set :unicorn_pid, -> { '/home/grizzly/current/tmp/pids/unicorn.grizzly.pid' }
set :unicorn_config_path, 'config/unicorn/production.rb'

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end
end
