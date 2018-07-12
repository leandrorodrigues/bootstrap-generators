require 'rails'

module Bootstrap
  module Generators
    class Engine < ::Rails::Engine
      config.app_generators.stylesheets false

      initializer 'bootstrap-generators.setup', group: :all do |app|
        app.config.assets.paths << ::File.expand_path('../../vendor/awesome/sass', __FILE__) if app.config.respond_to?(:sass)

        app.config.assets.paths << ::Rails.root.join('app', 'assets', 'fonts')

        app.config.assets.precompile << /\.(?:svg|eot|woff|woff2|ttf)$/
      end
    end
  end
end
