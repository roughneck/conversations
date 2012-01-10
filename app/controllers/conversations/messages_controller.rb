module Conversations
  class MessagesController < ::ApplicationController
    include ApplicationHelper

    def create
      redirect_to users_path unless current_user

      @conversation = UserConversation.find params[:conversation_id]
      @message = @conversation.conversation.messages.build params[:conversations_message]
      @message.user = current_user
      @message.conversation.messages.first.user = current_user
      @message.save!
      redirect_to user_conversation_path(current_user, @conversation)
    end
  end
end