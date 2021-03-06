module Conversations

  class Engine < Rails::Engine
    
    config.generators do |g|
      g.test_framework :rspec, :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end

    initializer "conversations.load_app_instance_data" do |app|
      Conversations.setup do |config|
        config.app_root = app.root
      end
    end
    
    initializer "conversations.load_static_assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end
    
    initializer "conversations.models.conversationalist" do
      ActiveSupport.on_load(:active_record) do
        include Conversations::Models::Conversationalist
      end
    end

    initializer 'conversations.controller' do
      ActiveSupport.on_load(:action_controller) do
        # include Conversations::ConversationsController::InstanceMethods
        # extend Conversations::ConversationsController::ClassMethods
      end
    end

  end
end