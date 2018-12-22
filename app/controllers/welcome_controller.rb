class WelcomeController < ApplicationController 
    def home
        if session[:user_id]
            @user = User.find_by_id(session[:user_id])
        end
    end
end