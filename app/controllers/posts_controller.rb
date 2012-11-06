class PostsController < ApplicationController
  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(params[:post])
  	@post.save
    if @post.save
      redirect_to @post, :notice => "Post created!"
    else
      flash[:error] = "Something went wrong"
      render :new
    end
  	# redirect_to @post, :notice => "Post created!"
  end

  def show
  	@post = Post.find(params[:id])
    @comments = @post.comments
    @comment = @post.comments.build
  end

  def index
  	@posts = Post.find(:all, :order => "created_at DESC")
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
end
