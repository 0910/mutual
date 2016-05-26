class AddInformationToProfessors < ActiveRecord::Migration
  def change
    add_column :professors, :city, :string
    add_column :professors, :coverage, :text
  end
end
