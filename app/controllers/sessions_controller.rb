class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "You are logged in!" + session[:user_name].to_s
      redirect_to root_path
    else
      flash.now[:danger] = "Your email or password doesn't match"
      render :new
    end
  end
  def destroy
    session[:user_id] = nil
    flash[:success] = "You are logged out!"
    redirect_to root_path
  end
end
