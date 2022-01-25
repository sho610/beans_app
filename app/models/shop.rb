class Shop < ApplicationRecord

  belongs_to :user
  has_many :prefectures, dependent: :destroy
  has_many :genres, dependent: :destroy
  has_many :shop_comments , dependent: :destroy
  has_many :favorites , dependent: :destroy

  accepts_nested_attributes_for :prefectures , :genres

  attachment :image, destroy: false
  
  validates :name, presence: true
  validates :overview, presence: true
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1}, presence: true

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
