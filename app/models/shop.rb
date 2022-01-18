class Shop < ApplicationRecord

  belongs_to :user
  has_one :prefecture, dependent: :destroy
  has_one :genre, dependent: :destroy
  has_many :shop_comments , dependent: :destroy
  has_many :favorites , dependent: :destroy

  accepts_nested_attributes_for :prefecture ,:genre

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
