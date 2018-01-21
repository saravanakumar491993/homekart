class StaticPagesController < ApplicationController
  skip_before_action :logged_in_user
  def about
  end

  def help
  end

  def contact
  end
end
