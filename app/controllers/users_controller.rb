class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new()
  end

  def create
    @user = User.create(user_params(:username, :password, :location, :age, :gender, :bio))
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages.to_sentence
      redirect_to new_user_path
    end
  end

  def edit
  end

  def update
    if @user.update(user_params(:location, :age, :gender, :bio))
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages.to_sentence
      redirect_to edit_user_path
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private
  def user_params(*args)
    params.require(:user).permit(*args)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
