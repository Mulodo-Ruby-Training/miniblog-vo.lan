class CommentsController < ApplicationController

layout false

	def new
		@comment = Comment.new
	end

	def create
		byebug
		@comment = Comment.new(params[:content],params[:post_id],params[:user_id])
		if @comment.save
			redirect_to post_path(post), :comment=>"Add comment"
		else
			redirect_to post_path(post)
	    end
    end

private
	 def comment_params
	 	params.require(:comment).permit(:content,:post_id,:user_id)
	 	
	 end
end
