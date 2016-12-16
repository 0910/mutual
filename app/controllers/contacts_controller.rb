class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Gracias por tu mensaje. Pronto nos pondremos en contacto.'
    else
      flash.now[:error] = 'El envío del mensaje ha fallado. Inténtalo nuevamente.'
    end
  end
end
