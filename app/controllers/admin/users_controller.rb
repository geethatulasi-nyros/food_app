class Admin::UsersController < ApplicationController
	before_action :authenticate_admin!
	before_action :set_user
	rescue_from ActiveRecord::RecordInvalid, :with => :user_error
	def index
		@users = User.all.order('created_at desc')
	end
	def new
		@user = User.new
	end
	def create
		@user = User.new(user_params)
		if @user.save!
			redirect_to admin_users_path
		else
			redirect_to new_admin_user_path
		end
	end
	def show
	end
	def edit
	end
	def update
		@user.update(user_params)
		redirect_to admin_users_path
	end
	def destroy
		@user.destroy
		redirect_to admin_users_path
	end

	private
		def user_params
			params.require(:user).permit(:name,:email,:password,:password_confirmation)
		end
		def set_user
			@user = User.find_by(id:params[:id])
		end
		def user_error
			flash[:error] = 'Email has already been taken.try with defferent email address'
			redirect_to new_admin_user_path
		end
end