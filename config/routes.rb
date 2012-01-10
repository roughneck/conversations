Rails.application.routes.draw do  
  resources :users do
    resources :conversations, :controller => "conversations/conversations", :only => [:new, :create]
    resources :conversations, :controller => "conversations/user_conversations", :except => [:new, :create] do
      resources :messages, :controller => "conversations/messages"
      member do
        post :mark_as_read
        post :mark_as_unread
      end
    end
  end
end
