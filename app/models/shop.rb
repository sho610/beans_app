class Shop < ApplicationRecord

  belongs_to :user
  has_many :prefectures, dependent: :destroy
  has_many :genres, dependent: :destroy
  has_many :shop_comments , dependent: :destroy
  has_many :favorites , dependent: :destroy

  accepts_nested_attributes_for :prefectures , :genres

  attachment :image, destroy: false

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
