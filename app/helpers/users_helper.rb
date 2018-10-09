module UsersHelper
  def admin?(user)
    if user.admin
      "<p>ADMIN</p>"
    end
  end
end
