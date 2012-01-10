require 'rails/generators'
require 'rails/generators/migration'

class ConversationsGenerator < Rails::Generators::Base
  include Rails::Generators::Migration
  def self.source_root
    @source_root ||= File.join(File.dirname(__FILE__), 'templates')
  end

  def self.next_migration_number(dirname)
    if ActiveRecord::Base.timestamped_migrations
      Time.new.utc.strftime("%Y%m%d%H%M%S")
    else
      "%.3d" % (current_migration_number(dirname) + 1)
    end
  end

  def create_migration_file
    migration_template '20120105153739_create_conversations.rb', 'db/migrate/create_conversations.rb'
    migration_template '20120105153800_create_conversations.rb', 'db/migrate/create_conversations.rb'
    migration_template '20120105153812_create_messages.rb', 'db/migrate/create_messages.rb'
  end
end
