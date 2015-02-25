class UsersController < ApplicationController
	before_action :authenticate_user!, except:[:index]
	def index   #get
		unless user_signed_in?
			render "index"
		else
			# byebug
			user = current_user
			@courses = user.courses
			render "index_admin"
		end
	end
	def new 	#get
	end
	def create 	#post
	end
	def show 	#get
	end
	def edit 	#get
	end
	def update 	#put/patch
	end
	def destroy #delete
		
	end
end
