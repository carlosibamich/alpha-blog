class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    admin = User.find_by(email: params[:session][:email].downcase, admin: true)
    if admin && admin.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have logged in as admin. With great power comes great responsibility!"
      redirect_to users_path
    elsif user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "There was something wrong with your login information"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out successfully"
    redirect_to root_path
  end
end
