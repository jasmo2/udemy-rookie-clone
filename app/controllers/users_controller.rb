class UsersController < ApplicationController
	before_action :authenticate_user!, except:[:index]
	def index   #get
		unless user_signed_in?
			render "index"
		else
			# byebug
			@courses = Course.all
			render "index_admin"
		end
	end
	def new 	#get
		@current_user = current_user
		@course = Course.new()
	end
	def create 	#post

	end
	def show 	#get
		user = current_user
		@courses = user.admin_courses
	end
	def edit 	#get

	end
	def update 	#put/patch
	end
	def destroy #delete
		
	end
	
end