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

set :linked_files, 'config/master.key'
append :linked_dirs, '.bundle', 'tmp/pids'

set :unicorn_pid, -> { '/home/grizzly/shared/tmp/pids/unicorn.grizzly.pid' }
set :unicorn_config_path, 'config/unicorn/production.rb'

set :default_env, {
  "RAILS_ENV" => "production",
  "RAILS_MASTER_KEY" => ENV["RAILS_MASTER_KEY"]
}

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end
end
