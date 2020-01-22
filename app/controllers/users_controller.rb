class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user
	def show
		header_search
		@total_dishes = @user.dishes
	end
	def edit
		header_search
		@total_dishes = @user.dishes
	end
	def update
		params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password_confirmation].blank?
		@user.update(user_params)
		if @user.update(user_params)
      # Sign in the user by passing validation in case their password changed
      flash[:success] = "Profile Updated Successfully"
      bypass_sign_in(@user)
      redirect_to edit_user_path(@user)
    else
      flash[:error] = "Failed to Update Profile"
      redirect_to edit_user_path(@user)
    end
	end
	# def update_password
 #    @user = current_user
 #    if @user.update(user_params)
 #      # Sign in the user by passing validation in case their password changed
 #      bypass_sign_in(@user)
 #      redirect_to user_path(@user)
 #    else
 #      render "edit"
 #    end
 #  end
 	def my_recipes
 		header_search
 		@user = current_user
 		@total_dishes = @user.dishes
 		@dishes = @user.dishes.order('created_at desc')
 	end
	private
		def header_search
			@search = Dish.includes(:images).ransack(params[:q])
			@dishes = @search.result
		end
		def user_params
			params.require(:user).permit(:name,:email,:password,:password_confirmation,:image)
		end
		def set_user
			@user = User.find_by(id:params[:id])
			# @total_dishes = @user.dishes
		end
end