require 'application_responder'

class ApplicationController < ActionController::Base
  layout :set_layout
  before_action :authenticate_user!
  self.responder = ApplicationResponder

  include Responder



  def set_layout
    user_signed_in? ? 'application' : 'login'
  end

end
