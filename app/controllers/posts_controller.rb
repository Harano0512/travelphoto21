class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  new create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:travel_date,:prefecture_id,:article,:image).merge(user_id: current_user.id, content_id: @post.content.id)
  end

end
