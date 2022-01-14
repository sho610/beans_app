class PrefecturesController < ApplicationController

  def new
    @prefecture = Prefecture.new
  end
  
  def create
    @prefecture = Prefecture.new
    @prefecture.save
    render "prefecture_path"
  end

end
