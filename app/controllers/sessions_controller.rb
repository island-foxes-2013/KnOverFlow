class SessionsController < ApplicationController

  def new #because rails is auto directing to 'new'
  end

  def create #creates a new session
    @user = User.find_by_email(params[:session][:email].downcase)
    if @user && @user.2(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to new_user_path
  end

end
