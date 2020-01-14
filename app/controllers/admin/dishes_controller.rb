class Admin::DishesController < ApplicationController
	before_action :authenticate_admin!
	before_action :set_dish
	def index
		@dishes = Dish.all
	end
	def new
		@dish = Dish.new
		@dish.images.build
	end
	def create
		@dish = Dish.new(dish_params)
		if @dish.save!
			flash[:success] = "Dish Posted Successfully"
			redirect_to admin_dishes_path
		else
			flash[:error] = "Dish not Posted"
			redirect_to new_admin_dish_path
		end
	end
	def show
		@reviews = @dish.reviews.includes(:user)
	end
	def edit
	end
	def update
		@dish.update(dish_params)
		redirect_to admin_dishes_path
	end
	def destroy
		@dish.destroy
		redirect_to admin_dishes_path
	end
	private
		def dish_params
			params.require(:dish).permit(:name,:price,:description,:category_id,images_attributes:[:id,:image]).merge(user_id:current_admin.id)
		end
		def set_dish
			@dish = Dish.find_by(id:params[:id])
		end
end