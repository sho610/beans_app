class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @shops = @user.shops
    @shop = Shop.new
    @users = User.all
    @prefecture = @shop.prefectures.new
    @genre = @shop.genres.new
  end

  def index
    @users = User.all
    @shop = Shop.new
    @prefecture = @shop.prefectures.new
    @genre = @shop.genres.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
    else
      @user = User.find(params[:id])
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless @user == current_user
  end
end
