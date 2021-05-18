module UsersHelper
  def is_admin
    "ADMIN" if @user.admin
  end
end
