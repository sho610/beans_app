class ShopsController < ApplicationController
  before_action :authenticate_user!

  def new
    @shop_new = Shop.new
    @user = current_user
  end

  def index
    @shops = Shop.all.page(params[:page]).per(3)
    @shop_new = Shop.new
    @user = current_user
  end

  def show
    @shop_new = Shop.new
    @shop = Shop.find(params[:id])
    @user = @shop.user
    @shop_comment = ShopComment.new
  end

  def create
    @shop_new = Shop.new(shop_params)
    @shop_new.user = current_user
    if @shop_new.save!
      redirect_to shop_path(@shop_new), notice: 'You have created shop successfully.'
    else
      @shops = Shop.all.page(params[:page]).per(3)
      @user = current_user
      render 'index'
    end
  end

  def edit
    @shop = Shop.find(params[:id])
    redirect_to shops_path if @shop.user != current_user
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)

      redirect_to shop_path(@shop), notice: 'You have updated shop successfully.'
    else
      render 'edit'
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy
    redirect_to shops_path
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :image, :overview, :rate, :genre, :prefecture) 
  end
end
