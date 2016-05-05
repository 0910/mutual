class RemoveLessonsFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :lessons, :string
  end
end
