class Users::SessionsController < Devise::SessionsController
  def destroy
    super

    flash.delete :notice
    cookies.clear(domain: :all)
  end
end
