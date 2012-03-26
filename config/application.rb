require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require *Rails.groups(:assets => %w(development test))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module EnodOrg
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework :rspec, :views => false, :fixture => true
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.form_builder :simple_form
      g.template_engine :haml
    end

    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += Dir["#{config.root}/lib/**/"]

    config.encoding = "utf-8"

    config.filter_parameters += [:password]

    config.assets.enabled = true

    config.assets.version = '1.0'
  end
end
