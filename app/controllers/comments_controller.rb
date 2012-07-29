class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    redirect_to post_path(@post)
  end

  def show
    if params[:post_id]
       @post = Post.find(params[:post_id])
       @comment = @post.comments.find(params[:id])
    else
       @comment = Comment.find(params[:id])
    end
    
    respond_to do |format|
      format.html
      format.json { render :json => @comment}
      format.xml { render :xml => @comment}
    end 
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
end
