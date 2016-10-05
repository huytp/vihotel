class ContactsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :admin_index]
  before_action :check_authorization, only: [:show, :admin_index]
  before_action :get_contact, only: [:show, :check]
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
    @contacts = Contact.order(created_at: :DESC).page(params[:page])
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def check
    if @contact.check
      @contact.check = false
    else
      @contact.check = true
    end
    if @contact.save
      flash[:notice] = I18n.t("update")
    else
      flash[:notice] = I18n.t("error")
    end
    redirect_to @contact
  end

  private
    def get_contact
      @contact = Contact.find(params[:id])
    end
    def check_authorization
      unless current_user.staff? || current_user.admin?
        redirect_to error_errors_path
      end
    end
    def get_params
      params.require(:contact).permit(:full_name, :email, :phone, :title, :content)
    end
end
