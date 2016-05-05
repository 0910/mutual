class HomeController < ApplicationController
  def demo
  	@courses = Course.all
  	@contact = Contact.new
  	render 'index'
  end
  def index
  	redirect_to "https://www.facebook.com/Mutual-1463358433988348"
  end
end
