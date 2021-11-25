require 'application_responder'

class ApplicationController < ActionController::Base
  layout :set_layout
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  self.responder = ApplicationResponder

  include Responder


  def set_layout
    user_signed_in? ? 'application' : 'login'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :first_name, :last_name, :username, :country, :time_zone])
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:first_name, :last_name, :phone])
  end

end
