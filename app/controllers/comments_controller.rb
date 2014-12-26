class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    # build initializes a new comment with post 
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
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    authorize @comment 
    
    if @comment.destroy 
      flash[:notice] = "Comment was removed"
      redirect_to [@topic, @post]
    else 
      flash[:error] = "Error deleting the comment"
      redirect_to [@topic, @post]
    end   
  end 
  
  
  private 
  
  def comment_params
    params.require(:comment).permit(:body)
  end   
end
