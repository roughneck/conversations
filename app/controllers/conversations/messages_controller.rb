module Conversations
  class MessagesController < ::ApplicationController
    include ApplicationHelper

    def create
      @user = User.find(params[:user_id])
      @conversation = UserConversation.find params[:conversation_id]
      @message = @conversation.conversation.messages.build params[:conversations_message]
      @message.user = @user
      if @message.save
        redirect_to user_conversation_path(@user, @conversation)
      else
        render template: 'conversations/user_conversations/show'
      end
    end
  end
end