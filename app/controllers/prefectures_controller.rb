class PrefecturesController < ApplicationController
  def show
    @prefecture = Prefecture.find(params[:id])
    @posts = Post.where(prefecture_id: params[:id]).page(params[:page]).per(10)
  end
end
