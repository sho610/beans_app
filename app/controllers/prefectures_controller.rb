class PrefecturesController < ApplicationController

  def new
    @prefecture = Prefecture.new
  end

  def create
    @prefecture = Prefecture.new(prefecture_params)
    @prefecture.save
    redirect_to prefectures_path
  end

  def index
    @prefectures = Prefecture.all
  end

  private

  def prefecture_params
    params.require(:prefecture).permit(:name)
  end

end
