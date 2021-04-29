class WelcomeController < ApplicationController
    skip_before_action :authenticated_user, only: [:home]

    # it looks like the solution used a static controller,
    # I chose to imitate the welcome pattern
    def home
        
    end
end