module UsersHelper
    
    def logged_in?
        session[:user_id] ? true : false
    end
    
    def current_user
        if logged_in?
            User.find(session[:user_id])
        else
            nil
        end
    end
end
