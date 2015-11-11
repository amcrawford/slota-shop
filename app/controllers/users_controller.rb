class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Logged in as #{@user.username}"
      redirect_to user_path(@user)
    else
      flash.now[:error] = @user.errors.full_messages.join(', ')
      render :new
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end


end
