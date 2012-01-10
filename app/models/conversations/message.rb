module Conversations
  class Message < ActiveRecord::Base
    attr_accessible :user_id, :conversation_id, :body
  
    belongs_to :user
    belongs_to :conversation
  
    validates :user_id, :presence => true
    validates :body, :presence => true
  end
end