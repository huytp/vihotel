class ContactsController < ApplicationController
  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(get_params)
    if @contact.save
      UserMailer.delay.welcome_email(@contact)
      flash[:notice] = "successfully"
      redirect_to root_path
    end
  end

  private
    def get_params
      params.require(:contact).permit(:full_name, :email, :phone, :title, :content)
    end
end
