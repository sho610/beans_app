class Shop < ApplicationRecord

  belongs_to :user
  has_one :prefecture, dependent: :destroy
  belongs_to :genre
  has_many :shop_comments , dependent: :destroy
  has_many :favorites , dependent: :destroy

  accepts_nested_attributes_for :prefecture

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
