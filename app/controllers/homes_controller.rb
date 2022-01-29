class HomesController < ApplicationController
  def top
    @shop_rank = Shop.find(Favorite.group(:shop_id).order('count(shop_id) desc').limit(3).pluck(:shop_id))
  end
end
