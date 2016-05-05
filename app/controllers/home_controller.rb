class HomeController < ApplicationController
  def index
  	@courses = Course.all
  	@contact = Contact.new
  end
  def fb
  	redirect_to "https://www.facebook.com/Mutual-1463358433988348"
  end
end
