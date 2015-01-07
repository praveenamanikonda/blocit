class FavoritesController < ApplicationController
  def create 
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.build(post: @post)
    authorize @favorite
    if @favorite.save
     flash[:notice] = "Favorite was saved."
     redirect_to [@post.topic, @post]
    else 
     flash[:error] = "There was an error saving the favorite. Please try again."
     redirect_to @post
    end   
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.find_by_post_id(@post.id)
    authorize @favorite
    if @favorite.destroy
     flash[:notice] = "Unfavorited."
     redirect_to [@post.topic, @post]
    else 
     flash[:error] = "There was an error while unfavoriting. Please try again."
     redirect_to [@post.topic, @post]
    end   
  end   
  
end
