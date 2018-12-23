class WelcomeController < ApplicationController
  skip_before_action :redirect_if_not_logged_in
    def home
       @user = current_user
    end
end
