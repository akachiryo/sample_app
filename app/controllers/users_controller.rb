class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      flash[:success] = "Welcome to App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def users_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
