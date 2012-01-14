class User < ActiveRecord::Base
  has_conversations
  
  attr_accessible :name
  
  validates :name, :presence => true, :uniqueness => true
end
