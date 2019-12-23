class ReviewsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_dish 
	rescue_from ActiveRecord::RecordInvalid, :with => :review_error
	def index
	end
	def new
		@review = Review.new
		add_breadcrumb I18n.t("breadcrumbs.dish"), dish_path(@dish)
		add_breadcrumb I18n.t("breadcrumbs.newreview"),new_dish_review_path, :only => %w(newreview)
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
		def review_error
			flash[:error] = 'You can not give more than one review'
			redirect_to new_dish_review_path
		end
end