module UsersHelper
  def admin?(user)
    if !!user.admin
      "ADMIN"
    end
  end
end
