class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = Post.order('travel_date DESC').find(@user.posts.ids)
  end

end
