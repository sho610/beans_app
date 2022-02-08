class SearchsController < ApplicationController


  def search
    @model = params['model']
    @content = params['content']
    @method = params['method']
    @records = search_for(@model, @content, @method)
  end

  private

  def search_for(model, content, method)
    if model == 'user'
      User.where('name LIKE ?', "%#{content}%")
    else
      Shop.search(model, content)
    end
  end


end
