require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :permission_denied
  after_action :verify_authorized, :except => :index, unless: :devise_controller?
  after_action :verify_policy_scoped, :only => :index

  protect_from_forgery with: :exception
end
