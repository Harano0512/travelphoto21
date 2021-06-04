class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :check_user, only: [:new, :create, :edit, :destroy, :update]

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: @post.id).order("created_at DESC")
  end

  def new
    @post = Post.new
    @comment = Comment.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to content_post_path(@post.content_id,@post.id)
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to content_path(@post.content.id)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to content_post_path(@post.content_id,@post.id)
    else
      render :edit
    end
  end


  private
  def post_params
    params.require(:post).permit(:subject, :travel_date, :prefecture_id, :article, images: [] ).merge(user_id: current_user.id, content_id: params[:content_id])
  end

  def check_user
    content = Content.find(params[:content_id])
    unless current_user.id == content.user_id
      redirect_to content_post_path(post.content_id,post.id)
    end
  end

end
