class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:check_user, :destroy,]
  before_action :check_user, only: [:destroy]

  def create
    post = Post.find(params[:post_id])
    comment = Comment.create(comment_params)
    redirect_to "/contents/#{post.content.id}/posts/#{post.id}"
  end

  def destroy
    post = Post.find("#{comment.post_id}")
    comment.destroy
    redirect_to "/contents/#{post.content.id}/posts/#{post.id}"
  end
  
  
  private
  def comment_params
    params.permit(:text, :post_id).merge(user_id: current_user.id)
  end

  def set_comment
    comment = Comment.find(params[:id])
  end

  def check_user
    unless current_user.id == comment.user_id
      redirect_to "/contents/#{post.content.id}/posts/#{post.id}"
    end
  end

end
