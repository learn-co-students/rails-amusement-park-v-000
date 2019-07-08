module ApplicationHelper
  def if_admin_add_attraction
    if @user.admin?
      link_to 'New Attraction', new_attraction_path
    end
  end
end
