class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = Post.find(@user.posts.ids)
  end

end
