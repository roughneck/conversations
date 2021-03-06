module Conversations
  module Models
    module Conversationalist
      def self.included(mod)
        mod.extend(ClassMethods)
      end
      
      module ClassMethods
        def has_conversations
          has_many :user_conversations, :class_name => Conversations::UserConversation
          has_many :conversations, :through => :user_conversations, :class_name => Conversations::Conversation
          has_many :messages, :through => :conversations, :class_name => Conversations::Message

          include InstanceMethods
        end
      end

      module InstanceMethods
      end
    end
  end
end