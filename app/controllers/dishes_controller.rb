class DishesController < ApplicationController
	before_action :authenticate_user!, except: [:index,:show]
	before_action :set_dish,only:[:show]
	def index
		# @dishes = current_user.dishes
		unless current_user
			@dishes = Dish.all
		else
			@dishes = current_user.dishes
		end
	end
	def new
		@dish = Dish.new
		@dish.images.build
	end
	def create
	  # binding.pry
		@dish = current_user.dishes.new(dish_params)
		@dish.save!
		redirect_to user_session_path
	end
	def show
		@reviews = @dish.reviews.includes(:user)
	end
	private
		def dish_params
			params.require(:dish).permit(:name,:price,:description,images_attributes:[:id,:image])
		end
		def set_dish
			unless current_user
				@dish = Dish.find_by(id:params[:id])
			else
				@dish = current_user.dishes.find_by(id:params[:id])
			end
		end
end