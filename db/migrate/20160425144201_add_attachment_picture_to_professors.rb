class AddAttachmentPictureToProfessors < ActiveRecord::Migration
  def self.up
    change_table :professors do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :professors, :picture
  end
end
