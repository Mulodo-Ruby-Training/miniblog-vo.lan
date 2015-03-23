class PostsController < ApplicationController
  
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  skip_before_action :verify_authenticity_token

  def index
  
    if params[:user_post]
       @posts = Post.post_of_user(params[:user_post]).paginate(:page => params[:page], :per_page => 10)
       flash[:count] = @posts.count
       flash[:name] = User.select(:id,:username).find_by_id(params[:user_post])
       
    else
       @posts = Post.all.paginate(:page => params[:page], :per_page => 10)

    end
  end

  def show
    
  end

  def new
    @post = Post.new
  end


  def edit
  end

  def create
    #byebug
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @posts_url, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :description, :user_id, :status,:image)
    end
end
