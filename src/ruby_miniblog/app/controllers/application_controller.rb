class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout "application_v1"
  before_action :posts_list
  helper_method :current_user

    def posts_list
    	@posts = Post.all
    end
private

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
end
