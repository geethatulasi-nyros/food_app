class Dish < ApplicationRecord
	belongs_to :user
	has_many :images,dependent: :destroy
	accepts_nested_attributes_for :images
	# has_many :comments,dependent: :destroy
	# accepts_nested_attributes_for :comments
	validates :name,:price,:description,presence: true
	ratyrate_rateable "taste"
	has_many :reviews 
	has_many :users, through: :reviews
	# accepts_nested_attributes_for :reviews
end
