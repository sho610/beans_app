class HomesController < ApplicationController

  def top
    # @random = Shop.order("RANDOM()").limit(3)
    @shop_rank = Shop.find(Favorite.group(:shop_id).order('count(shop_id) desc').limit(3).pluck(:shop_id))
  end

end
