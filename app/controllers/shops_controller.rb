class ShopsController < ApplicationController

  def index
    @shops = Shop.all
    @shop_new =Shop.new
    @user = current_user
  end

  def show
    @shop_new = Shop.new
    @shop= Shop.find(params[:id])
    @user = @shop.user
    @shop_comment =ShopComment.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user_id = current_user.id
    if @shop.save
      redirect_to shop_path(@shop), notice: "You have created book successfully."
    else
      @shops = Shop.all
      render 'index'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :image, :overview, :rate)
  end
end
