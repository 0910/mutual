class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|
      t.string :name
      t.text :bio
      t.string :email
      t.string :has_car
      t.string :has_location
      t.string :province

      t.timestamps null: false
    end
  end
end
