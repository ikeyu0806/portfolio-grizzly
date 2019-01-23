# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Grizzly
  class Application < Rails::Application
    config.load_defaults 5.2
    config.autoload_paths << "Rails.root.join('/app/uploaders')"

    # angle setting
    config.assets.paths << Rails.root.join('vendor', 'assets', 'node_modules')
    config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/
    config.assets.precompile << /\.(?:png|jpg)$/
    config.assets.precompile += %w[base.js]
    config.assets.precompile += %w[base.css]
    config.assets.precompile += ['angle/themes/theme-a.css',
                                 'angle/themes/theme-b.css',
                                 'angle/themes/theme-c.css',
                                 'angle/themes/theme-d.css',
                                 'angle/themes/theme-e.css',
                                 'angle/themes/theme-f.css',
                                 'angle/themes/theme-g.css',
                                 'angle/themes/theme-h.css']
    config.assets.precompile += [
      # Scripts
      'charts.js',
      'dashboard.js',
      'elements.js',
      'extras.js',
      'forms.js',
      'maps.js',
      'multilevel.js',
      'pages.js',
      'tables.js',
      'widgets.js',
      'blog.js',
      'ecommerce.js',
      'forum.js',
      # Stylesheets
      'charts.css',
      'dashboard.css',
      'elements.css',
      'extras.css',
      'forms.css',
      'maps.css',
      'multilevel.css',
      'pages.css',
      'tables.css',
      'widgets.css',
      'blog.css',
      'ecommerce.css',
      'forum.css'
    ]
  end
end
