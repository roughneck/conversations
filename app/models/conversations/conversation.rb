module Conversations
  class Conversation < ActiveRecord::Base
    attr_accessible :subject, :to_tokens
    attr_accessor :to_tokens
  
    has_many :user_conversations
    has_many :users, :through => :user_conversations
    has_many :messages

    accepts_nested_attributes_for :messages
    
    validates :subject, :presence => :true
    
    def to_tokens=(ids)
      self.user_ids = ids.split(",")
    end
    
  end
end