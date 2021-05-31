class ContentsController < ApplicationController
  before_action :authenticate_user!, expect: [:index]

  def index
   @contents = Content.order("created_at DESC")
  end

  def new
    @content = Content.new
    @users = User.all
  end

  def create
    @content = Content.new(content_params)
    if @content.save
      redirect_to contents_path
    else
      render :new
    end
  end

  def show
    @content = Content.find(params[:id])
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

end
