module Conversations
  class ConversationsController < ::ApplicationController
    include ApplicationHelper

    def new
      redirect_to users_path unless current_user

      @user = User.find(params[:user_id])
      @conversation = Conversation.new
      @conversation.messages.build
    end

    def create
      redirect_to users_path unless current_user

      @user = User.find(params[:user_id])
      @conversation = Conversation.new params[:conversations_conversation]
      @conversation.user_conversations.build
      @conversation.user_conversations.first.user = current_user
      # TODO: remove, workaround
      @conversation.messages.build :body => params[:conversations_conversation][:messages_attributes]['0'][:body]
      @conversation.messages.first.user = current_user
      
      if @conversation.save!
        redirect_to user_conversation_path(@user, @user.user_conversations.last), notice: 'Conversation was successfully created.'
      else
        render action: "new"
      end
    end

  end
end