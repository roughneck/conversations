class User < ActiveRecord::Base
  has_conversation
  
  attr_accessible :name
  
  validates :name, :presence => true, :uniqueness => true
end
