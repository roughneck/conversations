require 'spec_helper'

describe Conversations::Conversation do
  let(:conversation) { Factory(:conversation) }
  
  before { @user = Factory.create(:user) }

  context "when subject given" do
    it { conversation.should be_valid }
  end
  
  context "when subject empty" do
    before { conversation.subject = nil }
    it { conversation.should_not be_valid }
  end
  
  context "when tokens_to are given" do
    before {conversation.users << @user }
    it { conversation.user_ids.should include(@user.id) }
  end
  
  context "when user_ids are empty" do
    before { conversation.user_ids = nil }
    it { conversation.user_ids.should_not include(@user.id) }
  end

end

