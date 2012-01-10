module Conversations
  class Conversation < ActiveRecord::Base
    attr_accessible :subject
  
    has_many :user_conversations
    has_many :users, :through => :user_conversations
    has_many :messages

    accepts_nested_attributes_for :messages
  
    validates :subject, :presence => :true
  end
end