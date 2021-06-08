class ContentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :articles, :photos, :prefectures]
  before_action :set_content, only: [:check_user, :show, :destroy, :edit, :update]
  before_action :check_user, only: [:edit, :destroy, :update]

  def index
   @contents = Content.order('created_at DESC').includes(:user)
   @contents = @contents.first(3)
   @prefectures = Prefecture.where.not(id: 1)
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.new(content_params)
    if @content.save
      redirect_to content_path(@content.id)
    else
      render :new
    end
  end

  def show
    @posts = Post.where(content_id: @content.id).order('travel_date')
  end

  def destroy
    @content.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    if @content.update(content_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def articles
    @contents = Content.order('created_at DESC').page(params[:page]).per(5).includes(:user)
  end

  def photos
    @posts = Post.order('created_at DESC').page(params[:page]).per(4)
  end

  def method_name
    @posts = Post.order('created_at DESC')
  end

  private
  def content_params
    params.require(:content).permit(:title, :from_date, :return_date).merge(user_id: current_user.id)
  end

  def set_content
    @content = Content.find(params[:id])
  end

  def check_user
    unless current_user.id == @content.user_id
      redirect_to content_path(@content.id)
    end
  end

end