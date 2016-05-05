class HomeController < ApplicationController
  def test
  	@courses = Course.all
  	@contact = Contact.new
  end
  def index
  	redirect_to "https://www.facebook.com/Mutual-1463358433988348"
  end
end
