module ApplicationHelper
    def logged_in?
        session[:user_id] ? true : false
    end

    def current_user
        if logged_in?
            @user = User.find(session[:user_id])
        end
    end

    def user_is_admin?
        current_user.try(:admin)
    end
end
