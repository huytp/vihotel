class ContactsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :admin_index]
  before_action :check_authorization, only: [:show, :admin_index]
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

  def admin_index
    @contacts = Contact.order(created_at: :DESC)
  end

  def show
    @contact = Contact.find(params[:id])
  end

  private
    def check_authorization
      unless current_user.author? || current_user.admin?
        redirect_to error_errors_path
      end
    end
    def get_params
      params.require(:contact).permit(:full_name, :email, :phone, :title, :content)
    end
end
