module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  # Redirects to stored location (or to the default).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user
	if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    end
  end


  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
    end
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
