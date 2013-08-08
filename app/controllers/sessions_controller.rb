class SessionsController < ApplicationController

  def new #because rails is auto directing to 'new'
  end

  def create #creates a new session
    @user = User.find_by_email(params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password]) 
      session[:user_id] = @user.id
      redirect_to root_path, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to new_user_path, :notice => "Logged Out!"
  end

end
