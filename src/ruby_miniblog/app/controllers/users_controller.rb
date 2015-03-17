class UsersController < ApplicationController

skip_before_action :verify_authenticity_token

def new
  @user = User.new
end

def create
byebug
  @user = User.new(user_params)
  if @user.save
    redirect_to log_in_path, :notice => "Signed up!"
  else
    render "new"
  end
end

#get strong params 
private
def user_params
  params.require(:user).permit(:email, :username, :first_name, :last_name, :display_name, :birthday, :avatar,:gender, :status, :password, :password_salt)
end
end