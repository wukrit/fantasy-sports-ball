class LoginController < ApplicationController

  def form
  end

  def auth
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user
    else
      flash[:errors] = "Invalid Credentials"
      redirect_to login_path
    end
  end

  def logout
    session.clear
    redirect_to login_path
  end

end
