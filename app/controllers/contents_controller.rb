class ContentsController < ApplicationController
  before_action :authenticate_user!, expect: [:index]

  def index
    
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.new(content_params)
    if @content.save
      redirect_to new_content_path(@content.id)
    else
      render :new
    end
  end

  private
  
  def content_params
    params.require(:content).permit(:title, :from_date, :return_date).merge(user_id: current_user.id)
  end

end
