# This will guess the User class
FactoryGirl.define do
  sequence :name do |n|
    "John Doe#{n}"
  end
  
  factory :user do
    name { FactoryGirl.generate(:name) }
  end
  
  sequence :subject do |n|
    "Subject#{n}"
  end
  
  factory :conversation, :class => 'conversations/conversation' do
    subject { FactoryGirl.generate(:subject) }
  end
  
  factory :message, :class => 'conversations/message' do
    association :user
    association :conversation
    body "Test"
  end
  
  factory :user_conversation, :class => 'conversations/user_conversation' do
    association :user
    association :conversation
  end
end