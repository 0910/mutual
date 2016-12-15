class CoursesController < ApplicationController
  def show
    @course = Course.friendly.find(params[:id])
  	@lessons = @course.lessons.all
  	@contact = Contact.new
  end
end
