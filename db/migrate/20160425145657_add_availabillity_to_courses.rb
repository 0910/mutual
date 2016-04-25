class AddAvailabillityToCourses < ActiveRecord::Migration
  def change
  	add_column :courses, :available, :string, :default => 'Yes'
  end
end
