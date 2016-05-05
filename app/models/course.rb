class Course < ActiveRecord::Base
  belongs_to :professor
  has_many :lessons, :dependent => :destroy
  accepts_nested_attributes_for :lessons, :allow_destroy => true
  has_attached_file :picture, :styles => { :thumb => "120x44>", :small => '640x237>', :medium => '860x267>', :large => '1080x400>', :high => '1440x533>' },
            :url  => "/assets/courses/:id/:style/:basename.:extension",
            :path => ":rails_root/public/assets/courses/:id/:style/:basename.:extension"
            
  	validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
