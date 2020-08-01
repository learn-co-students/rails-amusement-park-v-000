module ApplicationHelper

    def current_user
        if !@current_user.nil?
            @current_user
        else 
            User.find_by_id(session[:user_id]) if session[:user_id]
        end
    end
    
end
