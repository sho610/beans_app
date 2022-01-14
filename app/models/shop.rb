class Shop < ApplicationRecord

  belongs_to :user
  belongs_to :prefecture
  belongs_to :genre
  has_many :shop_comments , dependent: :destroy
  has_many :favorites , dependent: :destroy

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
