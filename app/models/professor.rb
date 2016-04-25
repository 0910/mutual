class Professor < ActiveRecord::Base
	has_many :courses
	has_attached_file :picture, :styles => { :thumb => "120x80>", :small => '480x320>', :medium => '720x480>', :large => '1080x720>', :high => '1920x1080>' },
            :url  => "/assets/professors/:id/:style/:basename.:extension",
            :path => ":rails_root/public/assets/professors/:id/:style/:basename.:extension"
            
  	validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
