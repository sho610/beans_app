class ShopsController < ApplicationController

  def new
    @shop_new =Shop.new
    @user = current_user
    # @shop = Shop.find(params[:id])
    @prefecture = @shop_new.prefectures.new
    @genre = @shop_new.genres.new
  end
  
  def index
    @shops = Shop.all
    @shop_new =Shop.new
    @user = current_user
    # @shop = Shop.find(params[:id])
    @prefecture = @shop_new.prefectures.new
    @genre = @shop_new.genres.new
  end

  def show
    @shop_new = Shop.new
    @shop= Shop.find(params[:id])
    @user = @shop.user
    @shop_comment =ShopComment.new
    @prefecture = @shop_new.prefectures.new
    @genre = @shop_new.genres.new
  end

  def create
    @shop = Shop.new(shop_params)
    @user = current_user
    @shop.user_id = current_user.id
    if @shop.save!
      redirect_to shop_path(@shop), notice: "You have created book successfully."
    else
      @shops = Shop.all
      @prefecture = @shops.prefecture
      @genre = @shops.genre
      render 'index'
    end
  end

  def edit
    @shop = Shop.find(params[:id])
    if @shop.user != current_user
      redirect_to shops_path
    end
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)

      redirect_to shop_path(@shop), notice: "You have updated book successfully."
    else
      render "edit"
      byebug
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy
    redirect_to shops_path
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :image, :overview, :rate, genres_attributes: [:id, :name, :shop_id], prefectures_attributes: [:id, :name, :shop_id])
  end
end
