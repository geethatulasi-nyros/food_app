class Admin::DashboardController < ApplicationController
	before_action :authenticate_admin!
	def index
		@users = User.all 
		@dishes = Dish.all 
		@new_dishes = Dish.order('created_at desc').limit(7)
		@new_users = User.order('created_at desc').limit(5)
	end
end