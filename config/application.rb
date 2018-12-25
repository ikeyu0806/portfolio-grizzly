require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Grizzly
  class Application < Rails::Application
    config.load_defaults 5.2
    config.autoload_paths << "#{Rails.root}/app/uploaders"
  end
end
