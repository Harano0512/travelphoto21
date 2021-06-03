class CommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    comment = Comment.create(comment_params)
    redirect_to "/contents/#{post.content.id}/posts/#{post.id}"
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

end
