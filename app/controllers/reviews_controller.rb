class ReviewsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_dish, only: [:create]
	def index
	end
	def new
		# @review = Review.new
	end
	def create
		@review = @dish.reviews.create(review_params)
		@review.save!
		redirect_to dish_path(@dish)
	end
	def show
	end
	private
		def review_params
			params[:review][:user_id] = current_user.id
			params.require(:review).permit(:rating,:review,:dish_id,:user_id)
		end
		def set_dish
			@dish=Dish.find_by(id:params[:dish_id])
		end
end