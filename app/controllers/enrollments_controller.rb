class EnrollmentsController < ApplicationController
	def create 	#post , params[:article]
		enrollment = Enrollment.new(enrollment_parameters)
		enrollment.save!
		redirect_to :controller => 'users', :action => 'index'
	end
	def destroy #delete

		enrollment = Enrollment.where(user_id: enrollment_parameters[:user_id], course_id: enrollment_parameters[:course_id]).take
		#@enrollment = enrollment.class
		enrollment.destroy
		redirect_to :controller => 'users', :action => 'index'
	end

	private
	def enrollment_parameters
		params.require(:enrollment).permit(:user_id,:course_id)
	end
end
