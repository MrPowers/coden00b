class PostsController < ApplicationController
  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(params[:post])
  	@post.user_id = current_user.id
    if @post.save
      redirect_to @post, :notice => "Post created!"
    else
      flash[:error] = "Please enter a valid url (i.e. http://google.com) and a post title."
      render :new
    end
  end

  def show
  	@post = Post.find(params[:id])
    @comments = @post.comments
    @comment = @post.comments.build
  end

  def index
  	#@posts = Post.find(:all, :order => "created_at DESC").page(params[:page]).per(30)
    # @posts = Kaminari.paginate_array(Post.all).page(params[:page])
    @posts = Post.includes(:comments, :user).order(:created_at).reverse_order.page params[:page]
    # @posts = Post.find(:all, :order=> 'created_at desc').page params[:page]
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])
  	@post.update_attributes(params[:post])
  	redirect_to @post, :notice => "Post updated!"
  end

  def delete
  	@post = Post.find(params[:id])
  end

  def vote_up
    begin
      current_user.vote_for(@post = Post.find(params[:id]))
      redirect_to posts_path
    rescue ActiveRecord::RecordInvalid
      flash[:error] = "You cannot vote on the same post twice"
      redirect_to posts_path
    end
  end

  def vote_down
    begin
      current_user.vote_against(@post = Post.find(params[:id]))
      redirect_to posts_path
    rescue ActiveRecord::RecordInvalid
      flash[:error] = "You cannot vote on the same post twice"
      redirect_to posts_path
    end
  end
end
