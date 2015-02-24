class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
    	t.integer :owner
    	t.string :name
    	t.text :text
      t.timestamps null: false
    end
    add_foreign_key :owner, :users
  end
end
