class Lesson < ActiveRecord::Base
	belongs_to :course
	def lesson_info
		"#{qty} clases --> $#{price}"
	end
end
