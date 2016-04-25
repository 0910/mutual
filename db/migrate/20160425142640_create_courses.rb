class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.references :professor, index: true, foreign_key: true
      t.integer :lessons
      t.string :google_link

      t.timestamps null: false
    end
  end
end
