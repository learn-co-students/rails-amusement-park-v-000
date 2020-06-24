module UsersHelper
    def display_user
        if current_user.admin == false
            render partial: 'user_display'
        else 
            render partial: 'admin_display'
        end
    end

end
