module Conversations
  module Models
    autoload :Conversationalist, 'conversations/models/conversationalist'
  end
  
  # Our host application root path
  # We set this when the engine is initialized
  mattr_accessor :app_root

  # Yield self on setup for nice config blocks
  class << self
   def setup
     yield self
   end
  end
end

# Require engine
require "conversations/engine"