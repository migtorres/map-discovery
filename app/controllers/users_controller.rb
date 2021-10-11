class UsersController < ApplicationController
  before_action :check_admin
  before_action :set_user, only: %i[ edit update destroy ]
  def index
    @users = User.all.order(:username)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_url, notice: "User was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :is_admin)
  end

  def check_admin
    unless !!session[:user_id] && User_find(session[:user_id]).is_admin
      respond_to do |fmt|
        fmt.html { redirect_to '/', notice: "Only admins can access this page" }
      end
    end
  end
end
