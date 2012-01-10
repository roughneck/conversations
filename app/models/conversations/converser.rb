module Conversations
  module Converser
    def has_conversation
      has_many :user_conversations, :class_name => "Conversations::UserConversation"
      has_many :conversations, :through => :user_conversations
      has_many :messages, :through => :conversations
      
      extend ClassMethods
      include InstanceMethods
    end

    module ClassMethods
      # def most_impressions
      #   self.scoped.select{|obj| obj.impression_count > 0}.sort_by{|obj| -obj.impression_count}
      # end
    end

    module InstanceMethods
      # def impression_count
      #   impressions.size
      # end
    end
  end
end