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

    def new
      redirect_to users_path unless current_user

      @user = User.find params[:user_id]
      @conversation = @user.user_conversations.build
      @conversation.build_conversation.messages.build
    end

    def create
      redirect_to users_path unless current_user

      @conversation = UserConversation.new params[:conversations_user_conversation]
      @conversation.conversation_attributes = params[:conversations_user_conversation][:conversation_attributes]
      @conversation.user = current_user
      @conversation.conversation.messages.build
      @conversation.conversation.messages.first.user = current_user
      @conversation.conversation.messages.first.body = params[:conversations_user_conversation][:conversation_attributes][:messages_attributes]['0'][:body]
      
      Rails.logger.debug " "
      Rails.logger.debug "########## user_conversation #{@conversation.inspect}"
      Rails.logger.debug "########## conversation #{@conversation.conversation.inspect}"
      Rails.logger.debug "########## message #{@conversation.messages.last.inspect}"
      Rails.logger.debug "########## params #{params[:conversations_user_conversation]}"
      Rails.logger.debug "########## params conversation_attributes #{params[:conversations_user_conversation][:conversation_attributes][:subject]}"
      Rails.logger.debug " "
      
      if @conversation.save!
        redirect_to user_conversation_path(current_user, @conversation), notice: 'Conversation was successfully created.'
      else
        render action: "new"
      end
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