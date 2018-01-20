module UsersHelper
  def admin_user?
     User.roles[@current_user.role] < User.roles[:sales_person]
  end

  def super_admin_user?
     User.roles[@current_user.role] == User.roles[:super_admin]
  end


  def admin_user
  	unless User.roles[@current_user.role] < User.roles[:sales_person]
    	redirect_to e_401_path
    end
  end

  def super_admin_user
  	unless User.roles[@current_user.role] == User.roles[:super_admin]
    	redirect_to e_401_path
    end
  end

end
