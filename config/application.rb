require_relative "boot"
require "rails/all"
Bundler.require(*Rails.groups)

module ExpJobRails
  class Application < Rails::Application
    config.active_record.query_log_tags_enabled = true
    config.active_record.query_log_tags = [
      :application, :controller, :action, :job,
      current_graphql_operation: -> { GraphQL::Current.operation_name },
      current_graphql_field: -> { GraphQL::Current.field&.path },
      current_dataloader_source: -> { GraphQL::Current.dataloader_source_class },
    ]
    Dotenv::Railtie.load
    config.load_defaults 7.1
    config.autoload_lib(ignore: %w(assets tasks))

    config.generators do |g|
      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_bot, dir: "spec/factories", fixture: false
      g.view_specs false
      g.helper_specs false
      g.routing_specs false
      g.controller_specs false
    end

    config.common = config_for(:common)
  end
end
