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
      redirect_to login_path_url
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to login_path_url
  end

end
