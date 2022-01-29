class SearchsController < ApplicationController


  def search
    @model = params['model']
    @content = params['content']
    @method = params['method']
    @records = search_for(@model, @content, @method)
  end

  private

  def search_for(model, content, method)

    case model
      when 'user' then
        User.where('name LIKE ?', "%#{content}%")
      when 'shop' then
        Shop.where('name LIKE ?', "%#{content}%")
      when 'prefecture' then
        prefecture_id = Shop.prefectures.select {|k, v| k.match(/#{content}/)}
        Shop.where(prefecture: prefecture_id.values)
      when 'genre' then
        genre_id = Shop.genres.select {|k, v| k.match(/#{content}/)}
        Shop.where(genre: genre_id.values)
      end

  end


end
