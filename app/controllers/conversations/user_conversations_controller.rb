module Conversations
  class UserConversationsController < ::ApplicationController
    include ApplicationHelper

    def index
      @user = User.find params[:user_id]
      @conversations = @user.user_conversations
    end

    def show
      @user = User.find params[:user_id]
      @conversation = UserConversation.find params[:id]
      @message = @conversation.conversation.messages.build
    end

    def mark_as_read
      @conversation = UserConversation.find params[:id]
      @conversation.update_attributes :read => true
      redirect_to user_conversation_path(current_user, @conversation)
    end

    def mark_as_unread
      @conversation = UserConversation.find params[:id]
      @conversation.update_attributes :read => false
      redirect_to user_conversation_path(current_user, @conversation)
    end
  end
end