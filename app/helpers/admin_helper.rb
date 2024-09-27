module AdminHelper

    def admin_new_attraction
      link_to "New Attraction", new_attraction_path if current_user.admin
    end

    def admin_edit_attraction
      link_to "Edit Attraction", edit_attraction_path if current_user.admin
    end

    def display_admin(user)
      content_tag(:p, "ADMIN") if user.admin
    end
end
