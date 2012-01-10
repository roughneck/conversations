module Conversations
  class UserConversation < ActiveRecord::Base
    attr_accessible :user_id, :conversation_id, :deleted, :read
  
    belongs_to :user
    belongs_to :conversation
    has_many :messages, :through => :conversation

    accepts_nested_attributes_for :conversation

    delegate :subject, :to => :conversation
    delegate :users, :to => :conversation
  
    validates :user_id, :presence => true
  
    # TODO: Add more attributes like :username, :first_name, :last_name
    def participants
      self.users.collect { |u| u.name }.join(', ')
    end

  end
end