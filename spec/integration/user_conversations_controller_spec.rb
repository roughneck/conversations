require 'spec_helper'

feature "UserConversation", %q{} do

  background do
    @sender = FactoryGirl.create(:user)
    @recipient = FactoryGirl.create(:user)
    @user_conversation = FactoryGirl.create(:user_conversation, :user => @recipient)
    @user_conversation.conversation.users << @recipient
    @user_conversation.conversation.users << @sender
    @user_conversation.conversation.save!
    
    visit user_path @sender
    click_link 'Sign In as This User'
    
    params = {"conversations_conversation"=>{"to_tokens"=>"#{@recipient.id}",
     "subject"=>"Test Conversation",
     "messages_attributes"=>{"0"=>{"body"=>"Test"}}},
     "commit"=>"Create Conversation",
     "user_id"=>"#{@sender.id}"}
    
    post user_conversations_path params
  end

  scenario "view a list of conversations" do
    visit user_conversations_path @sender
    page.should have_content('Test Conversation')
  end
  
  scenario "view new conversation form" do
    visit new_user_conversation_path @sender
    page.should have_content('To tokens')
  end
  
  scenario "view a conversation" do
    visit user_conversation_path @sender, @user_conversation
    page.should have_content('Participants')
  end
  
  scenario "mark a conversation as un/read" do
    visit user_path @recipient
    click_link 'Sign In as This User'
    visit user_conversation_path @recipient, @user_conversation
    page.should have_content('Mark As Read')
    click_link 'Mark As Read'
    page.should have_content('Mark As Unread')
    click_link 'Mark As Unread'
    page.should have_content('Mark As Read')
  end
  
end