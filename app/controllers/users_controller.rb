class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      p "this is inside the save #{@user}"
      redirect_to root_path
    else
      p "this is not saved #{@user}"
      flash[:error] = "Please try again"
      render 'new'
    end
  end

  def show
  end
end
