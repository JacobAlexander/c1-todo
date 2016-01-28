class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "User #{@user.name} created!"
      session[:user_id] = @user.id
      flash[:success] = "You are logged in!"
      redirect_to root_path
    else
      flash.now[:danger] = "Error"
      render :new
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
