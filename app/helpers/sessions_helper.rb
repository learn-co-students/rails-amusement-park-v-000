module SessionsHelper

    def log_in(user)
        session[:name] = user.name
    end

   

    def log_out
        session.delete :name
        @current_user = nil
    end
end
