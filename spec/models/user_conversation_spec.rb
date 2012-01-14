require 'spec_helper'

describe Conversations::UserConversation do
  let(:user_conversation) { Factory(:user_conversation) }
  
  before { @user = Factory.create(:user) }

  context "when subject given" do
    it { user_conversation.should be_valid }
  end
  
  context "when user empty" do
    before { user_conversation.user = nil }
    it { user_conversation.should_not be_valid }
  end

end

