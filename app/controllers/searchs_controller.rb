class SearchsController < ApplicationController
  before_action :set_search

  # def search
  #   @model = params['model']
  #   @content = params['content']
  #   @method = params['method']
  #   @records = search_for(@model, @content, @method)
  # end

  # private

  # def search_for(model, content, method)
  #   if model == 'user'
  #     if method == 'perfect'
  #       User.where(name: content)
  #     else
  #       User.where('name LIKE ?', '%' + content + '%')
  #     end
  #   elsif model == 'shop'
  #     if method == 'perfect'
  #       Shop.where(name: content)
  #     else
  #       Shop.where('name LIKE ?', '%' + content + '%')
  #     end
  #   end
  # end

  def set_search
    @search = Shop.ransack(params[:q])
    @search_shops = @search.result
  end
end
