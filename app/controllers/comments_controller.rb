class CommentsController < ApplicationController
  respond_to :html, :js
  def create 
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    # build initializes a new comment with post 
    @comments = @post.comments
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    authorize @comment 
    @new_comment = Comment.new 
    
    if @comment.save
      flash[:notice] = "Comment was created"
    else 
      flash[:error] = "There was an error saving comment. Please try again."
    end 
    
   respond_with(@comment) do |format|
      format.html { redirect_to [@post.topic, @post] }
    end    
  end
  
  def destroy 
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.find(params[:id])
    authorize @comment 
    
    if @comment.destroy 
      flash[:notice] = "Comment was removed"
    else 
      flash[:error] = "Error deleting the comment"
    end  
    
    respond_with(@comment) do |format|
      format.html { redirect_to [@post.topic, @post] }
    end   
  end 
  
  
  private 
  
  def comment_params
    params.require(:comment).permit(:body)
  end   
end
