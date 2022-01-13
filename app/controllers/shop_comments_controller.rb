class ShopCommentsController < ApplicationController

  def create
    @shop =Shop.find(params[:shop_id])
    @comment = current_user.shop_comments.new(shop_comment_params)
    @comment.shop_id=@shop.id
    @comment.save
    # redirect_to request.referer
    render :shop_comments
  end

  def destroy

    ShopComment.find_by(id: params[:id]).destroy
    @shop= Shop.find(params[:shop_id])
    render :shop_comments
    # redirect_to request.referer
  end

  private

  def shop_comment_params
    params.require(:shop_comment).permit(:comment)
  end

end
