require 'spec_helper'

describe Conversations do
  include Capybara::DSL
  
  it "should be valid" do
    Conversations.should be_a(Module)
  end
  
  it "should be a valid app" do
    ::Rails.application.should be_a(Dummy::Application)
  end
end

feature "Conversation", %q{} do

  background do
    @sender = FactoryGirl.create(:user)
    @recipient = FactoryGirl.create(:user)
    @user_conversation = FactoryGirl.create(:user_conversation, :user => @recipient)
    @user_conversation.conversation.users << @recipient
    @user_conversation.conversation.users << @sender
    @user_conversation.conversation.save!
  end

  scenario "create a new conversation" do
    visit user_path @sender
    click_link 'Sign In as This User'
    
    params = {"conversations_conversation"=>{"to_tokens"=>"#{@recipient.id}",
     "subject"=>"Test Conversation",
     "messages_attributes"=>{"0"=>{"body"=>"Test"}}},
     "commit"=>"Create Conversation",
     "user_id"=>"#{@sender.id}"}
    
    post user_conversations_path params
    response.should redirect_to user_conversation_path(@sender, @sender.user_conversations.last)
    flash[:notice].should_not be_nil
  end
  
  scenario "return to from committing a invalid conversation" do
    visit user_path @sender
    click_link 'Sign In as This User'
    
    params = {"conversations_conversation"=>{"to_tokens"=>"#{@recipient.id}",
     "messages_attributes"=>{"0"=>{"body"=>"Test"}}},
     "commit"=>"Create Conversation",
     "user_id"=>"#{@sender.id}"}
    
    post user_conversations_path params
    response.should render_template("new")
  end
  
end