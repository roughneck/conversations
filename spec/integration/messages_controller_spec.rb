feature "Message", %q{} do

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
    
    params = {"conversations_message"=>{"body"=>"Test"},
     "commit"=>"Create Message",
     "user_id"=>@sender.id,
     "conversation_id"=>@user_conversation.conversation.id}
    
    post user_conversation_messages_path params
    response.should redirect_to user_conversation_path(@sender, @user_conversation.conversation)
  end
  
  scenario "return to from committing a invalid conversation" do
    visit user_path @sender
    click_link 'Sign In as This User'
    
    params = {"commit"=>"Create Message",
     "user_id"=>@sender.id,
     "conversation_id"=>@user_conversation.conversation.id}
    
    post user_conversation_messages_path params
    response.should render_template("show")
  end
  
end