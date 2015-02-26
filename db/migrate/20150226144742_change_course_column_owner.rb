class ChangeCourseColumnOwner < ActiveRecord::Migration
  def change
    rename_column :courses, :owner, :owner_id
  end
end
