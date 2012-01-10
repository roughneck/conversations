# Requires
require "active_support/dependencies"

module Conversations
  # Our host application root path
  # We set this when the engine is initialized
  mattr_accessor :app_root

  # Yield self on setup for nice config blocks
  def self.setup
    yield self
  end
end

# Require engine
require "conversations/engine"