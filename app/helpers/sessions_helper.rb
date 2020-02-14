module SessionsHelper

    def log_in(user)
        session[:name] = user.name
    end

    def current_user
        @current_user ||= User.find_by(id: session[:name])
    end

    def logged_in?
        !current_user.nil?
    end

    def log_out
        session.delete :name
        @current_user = nil
    end
end
