class ApplicationController < ActionController::Base

  protect_from_forgery

  private

  def current_user
    # p "*"*100
    # p "in current user method"
    @current_user ||=User.find(session[:user_id]) if session[:user_id]
    # p "#{current_user}"
    # p "finished current_user"
    # p "*"*100
  end

  def logged_in?
    !current_user.nil?
  end
end
