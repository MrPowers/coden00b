class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    redirect_to post_path(@post)
  end

  def index
  	@comments = Comment.find(:all, :order => "created_at DESC")
  end

end
