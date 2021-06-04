class ContentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_user, only: [:edit, :destroy, :update]

  def index
   @contents = Content.order('created_at DESC')
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
    @content = Content.find(params[:id])
    @posts = Post.where(content_id: @content.id).order('travel_date')
  end

  def destroy
    @content = Content.find(params[:id])
    @content.destroy
    redirect_to root_path
  end

  def edit
    @content = Content.find(params[:id])
  end

  def update
    @content = Content.find(params[:id])
    if @content.update(content_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def content_params
    params.require(:content).permit(:title, :from_date, :return_date).merge(user_id: current_user.id)
  end

  def check_user
    content = Content.find(params[:id])
    unless current_user.id == content.user_id
      redirect_to content_path(content.id)
    end
  end

end