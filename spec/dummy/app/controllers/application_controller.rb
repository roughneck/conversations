class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  
  def current_user
    begin
      session[:current_user_id] ? User.find(session[:current_user_id]) : nil
    rescue ActiveRecord::RecordNotFound
      nil
    end
  end
end
