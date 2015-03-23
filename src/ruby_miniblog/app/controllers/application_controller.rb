class ApplicationController < ActionController::Base
  
  layout "application_v1"
  
  helper_method :current_user
  
  before_action :all_post

private
	def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
      
	end

  def all_user
    @user = User.all
  end
  
  def all_post
    @posts = Post.all.paginate(:page => params[:page], :per_page => 10)
  end
end
