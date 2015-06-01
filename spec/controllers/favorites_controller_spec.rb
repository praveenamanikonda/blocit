require 'rails_helper'
require 'comment'
require 'post'
require 'user'

describe FavoritesController do
  
  include Devise::TestHelpers
  describe '#create' do 
    before do
      @user = create(:user)
      @post = create(:post, user: @user)
      create(:comment, user: @user, post: @post)
      @user.favorites.build
    end
    
    it "creates a favorite for the current user and specified post" do 
      expect( @user.favorites.find_by_post_id(@post.id) ).to be_nil
      
      post :create, { current_user: @user, cd post_id: @post.id }
      
      expect( @user.favorites.find_by_post_id(@post.id) ).not_to be_nil 
    end  
  end  
  
#   describe '#destroy' do
#     it "destroys the favorite for the current user and specified post" do 
#       favorite = @user.favorites.where(post: @post).create
#       expect( @user.favorites.find_by_post_id(@post.id) ).not_to be_nil 
      
#       delete :destroy, { post_id: @post.id, id: favorite.id }
#       expect( @user.favorites.find_by_post_id(@post.id) ).to be_nil      
#     end 
#   end   
end 
