class UsersController < ApplicationController

before_action :set_user, only: [:edit, :update]

skip_before_action :verify_authenticity_token

def new
  @user = User.new
end

def edit

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
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to homes_path, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
end
#get strong params 
private

def set_user
      @user = User.find(params[:id])
end

def user_params
  params.require(:user).permit(:email, :username, :first_name, :last_name, :display_name, :birthday, :avatar,:gender, :status, :password, :password_salt)
end
end