class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_no_cache  
  before_action :logged_in_user
  
  include SessionsHelper
  include UsersHelper
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to e_401_path, :alert => exception.message
  end

  private
	  def set_no_cache
		response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
		response.headers["Pragma"] = "no-cache"
		response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
	  end
end
