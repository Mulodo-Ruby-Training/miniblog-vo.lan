class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  layout "application_v1"
  
  helper_method :current_user
  
  before_action :all_post

private
	def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
      
	end
  
  def all_post
    @posts = Post.all.paginate(:page => params[:page], :per_page => 3)
  end
end
