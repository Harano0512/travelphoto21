class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = Post.find_by(user_id: @user.id)
  end
end
