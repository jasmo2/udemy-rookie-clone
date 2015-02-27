# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  owner_id    :integer
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Course < ActiveRecord::Base
	validates :name, presence: true
	validates :description, presence: true
	has_many :enrollments
	has_many :users, :through => :enrollments

	belongs_to :owner, class_name: :User
    
end
