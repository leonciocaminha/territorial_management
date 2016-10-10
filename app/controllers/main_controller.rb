class MainController < ApplicationController
  before_filter :authenticate_user!

  def index
    skip_authorization
  end
end
