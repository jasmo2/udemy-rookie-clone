# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#  username               :string
#

class User < ActiveRecord::Base

	has_many :enrollments
	has_many :courses, :through => :enrollments

	has_many :admin_courses, foreign_key: :owner_id , class_name: "Course"
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable
	def enrolled?(course)
		courses_ids_array = self.courses.pluck(:id)
		courses_ids_array.include?(course.id)
  	end
  	def creator?(course)
  		courses_ids_array = self.admin_courses.pluck(:id)
		courses_ids_array.include?(course.id)
  	end
end
