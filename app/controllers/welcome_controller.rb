class WelcomeController < ApplicationController
    def index
        if signed_in?
            @user = current_user 
        else
            @user = User.new
        end
    end
end