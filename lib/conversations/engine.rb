module Conversations

  class Engine < Rails::Engine

    initializer "conversations.load_app_instance_data" do |app|
      Conversations.setup do |config|
        config.app_root = app.root
      end
    end
    
    initializer "conversations.load_static_assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end
    
    initializer "conversations.models.converser" do
      ActiveSupport.on_load(:active_record) do
        include Conversations::Models::Converser
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