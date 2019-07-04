module UsersHelper
  def display_admin(user)
    content_tag(:p, "ADMIN") if user.admin
  end

end
