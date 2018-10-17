module SessionsHelper
    def signin(user)
        session[:user_id] = user.id
    end
    
    def signed_in?
        session[:user_id]
    end
    
    def current_user
        User.find(session[:user_id])
    end
    
end