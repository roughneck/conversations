User.delete_all
user1 = User.create!(:name => 'Max Mustermann')
user2 = User.create!(:name => 'John Doe')
user3 = User.create!(:name => 'Juan Lopez')

Conversations::UserConversation.delete_all
Conversations::Conversation.delete_all
Conversations::Message.delete_all

# uc1 = Conversations::UserConversation.new :user_id => user1.id, :to_tokens => "#{user2.id},#{user3.id}"
# uc1.conversation :subject => 'Test'
# uc1.save!