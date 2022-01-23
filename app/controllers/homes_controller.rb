class HomesController < ApplicationController

  def top
    @random = Shop.order("RANDOM()").limit(3)
  end

end
