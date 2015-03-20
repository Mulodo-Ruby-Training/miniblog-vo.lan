class UsersController < ApplicationController

  before_action :set_user, only: [:edit,:update,:show]

  skip_before_action :verify_authenticity_token

  def index
    @users = User.all

  end

  def new
    @user = User.new

  end

  def edit

  end
  def show

  end

  def create
#byebug
@user = User.new(user_params)
if @user.save
  redirect_to log_in_path, :notice => "Signed up!"
else
  render "new"
end
end

def update
  if params[:flag].present? 
    respond_to do |format|
      if @user.update(user_edit_params)
        format.html { redirect_to homes_path, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  elsif
      user = User.authenticate(current_user.username, params[:user][:password_old])
      if user 
        @user.update(user_change_password_params)
        flash[:change] = "Change password successfully"
        redirect_to user_path
      else
      flash[:change] = "Password current incorrect"
      redirect_to user_path
    end
  else
    flash[:unchange] ="Change password unsuccessfully"
    redirect_to user_path 
  end
end

def change_password
  byebug
end

#get strong params 
private

def set_user
  @user = User.find(params[:id])
end

def user_params
  params.require(:user).permit(:email, :username, :first_name, :last_name, :display_name, :birthday, :avatar,:gender, :status, :password, :password_salt)
end

def user_edit_params
  params.require(:user).permit(:email, :username, :first_name, :last_name, :display_name, :birthday, :avatar,:gender)
end

def user_change_password_params
  params.require(:user).permit(:password, :password_salt)
end

end