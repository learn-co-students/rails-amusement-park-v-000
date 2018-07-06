module UsersHelper
  def for_user
    if current_user.admin?
      "hidden"
    else
      "active"
    end
  end

  def for_admin
    if current_user.admin?
      "active"
    else
      "hidden"
    end
  end
end
