class SessionsController < ApplicationController
  skip_before_action :logged_in_user

  def new
  	redirect_back_or new_category_path if logged_in?
  end

  def create
	user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
   		log_in user
      	redirect_back_or root_url
    else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
