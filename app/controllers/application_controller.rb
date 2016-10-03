class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale

  protected
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to error_errors_path
  end
  def set_locale
    if params[:locale].present?
      cookies[:locale] = params[:locale]
    end
    I18n.locale = cookies[:locale] || I18n.default_locale
  end
end
