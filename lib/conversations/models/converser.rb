module Conversations
  module Models
    module Converser
      def self.included(mod)
        mod.extend(ClassMethods)
      end
      
      module ClassMethods
        def has_conversation
          has_many :user_conversations, :class_name => "Conversations::UserConversation"
          has_many :conversations, :through => :user_conversations
          has_many :messages, :through => :conversations

          include InstanceMethods
        end
      end

      module InstanceMethods
      end
    end
  end
end