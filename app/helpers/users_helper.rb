module UsersHelper
  def admin
    @user = User.find_by(id: params[:id])
      if @user.admin 
        @user_admin = @user
      end
  end
end
