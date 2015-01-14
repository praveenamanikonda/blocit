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
    
    if @comment.save
      redirect_to [@topic, @post] , notice: "Comment saved successfully"
    else 
      flash[:error] = "Comment failed. Please try again."
      redirect_to [@topic, @post]
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
