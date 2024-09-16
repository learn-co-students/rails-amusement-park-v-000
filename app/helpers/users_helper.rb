module UsersHelper
  def is_admin?
		if @user.admin
			'ADMIN'
		end
	end
end
