module Conversations
  class UserConversation < ActiveRecord::Base
    attr_accessible :user_id, :conversation_id, :deleted, :read, :to_tokens
    attr_accessor :to_tokens
  
    belongs_to :user
    belongs_to :conversation
    has_many :messages, :through => :conversation

    accepts_nested_attributes_for :conversation

    delegate :subject, :to => :conversation
    delegate :users, :to => :conversation

    before_create :create_user_conversations
  
    validates :user_id, :presence => true
  
    # TODO: Add more attributes like :username, :first_name, :last_name
    def sender
      self.user.name
    end
  
    def to_tokens=(ids)
      self.build_conversation if self.conversation.nil?
      self.conversation.user_ids = ids.split(",")
    end
  
    private

    def create_user_conversations
      self.conversation.user_ids.each do |recip|
        UserConversation.create :user_id => recip, :conversation => conversation
      end
    end
  end
end