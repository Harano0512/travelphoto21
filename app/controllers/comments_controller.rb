class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user, only: [:destroy]

  def create
    post = Post.find(params[:post_id])
    comment = Comment.new(comment_params)

    if comment.save
      redirect_to "/contents/#{post.content.id}/posts/#{post.id}"
    else
      @post = Post.find(params[:post_id])
      @comments = Comment.where(post_id: @post.id).order("created_at DESC").includes(:user)
      render template: "posts/show"
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    post = Post.find("#{comment.post_id}")
    comment.destroy
    redirect_to "/contents/#{post.content.id}/posts/#{post.id}"
  end
  
  
  private
  def comment_params
    params.permit(:text, :post_id).merge(user_id: current_user.id)
  end

  def check_user
    comment = Comment.find(params[:id])
    unless current_user.id == comment.user_id
      redirect_to "/contents/#{post.content.id}/posts/#{post.id}"
    end
  end

end
