module UsersHelper

  def is_admin?(user)
    unless user.admin != true
      return "ADMIN"
    end
  end

end
