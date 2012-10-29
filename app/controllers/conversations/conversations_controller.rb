module Conversations
  class ConversationsController < ::ApplicationController
    include ApplicationHelper

    def new
      @user = User.find(params[:user_id])
      @conversation = Conversation.new
      @conversation.messages.build
    end

    def create
      @user = User.find(params[:user_id])
      @conversation = Conversation.new params[:conversations_conversation]
      @conversation.user_conversations.build
      @conversation.user_conversations.first.user = @user
      # @conversation.messages.build if @conversation.messages.empty?
      @conversation.messages = []
      @conversation.messages.build body: params[:conversations_conversation][:messages_attributes]['0'][:body], user_id: @user.id
      if @conversation.save
        redirect_to user_conversation_path(@user, @user.user_conversations.last), notice: 'Conversation was successfully created.'
      else
        render action: "new"
      end
    end

  end
end