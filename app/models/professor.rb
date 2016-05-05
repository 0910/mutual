class Professor < ActiveRecord::Base
	has_many :courses
	has_attached_file :picture, :styles => { :thumb => "90x90#", :small => '240x240#' },
            :url  => "/assets/professors/:id/:style/:basename.:extension",
            :path => ":rails_root/public/assets/professors/:id/:style/:basename.:extension"
            
  	validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
