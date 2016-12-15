class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Gracias por tu mensaje. Pronto nos pondremos en contacto.'
      render 'home/index'
    else
      flash.now[:error] = 'El envío del mensaje ha fallado. Inténtalo nuevamente.'
      render 'home/index'
    end
  end
end
