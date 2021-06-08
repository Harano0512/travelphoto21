class PrefecturesController < ApplicationController
  def show
    @prefecture = Prefecture.find(params[:id])
    @posts = Post.where(prefecture_id: params[:id]).order("travel_date ASC").page(params[:page]).per(10)
  end
end
