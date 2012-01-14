require 'spec_helper'

describe Conversations::Message do
  let(:message) { Factory(:message) }
  
  before { @user = Factory.create(:user) }

  context "when body given" do
    it { message.should be_valid }
  end
  
  context "when body empty" do
    before { message.body = nil }
    it { message.should_not be_valid }
  end
  
  context "when user empty" do
    before { message.user = nil }
    it { message.should_not be_valid }
  end
  
end

