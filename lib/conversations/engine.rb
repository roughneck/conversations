require 'rails'

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
    
    initializer 'conversations.extend_ar' do |app|
      ActiveRecord::Base.extend Conversations::Converser
    end

    initializer 'conversations.controller' do
      ActiveSupport.on_load(:action_controller) do
        # include Conversations::ImpressionsController::InstanceMethods
        # extend Conversations::ImpressionsController::ClassMethods
      end
    end

  end
end