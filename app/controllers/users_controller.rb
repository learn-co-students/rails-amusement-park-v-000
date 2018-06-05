class UsersController < ApplicationController

  def new
  end

  # Create Action
  def create
  end

  # Profile Page
  def show
  end


  private

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end

# rspec spec/features/users_features_spec.rb --format d
# rspec spec/support/login_helper.rb --format d

# Referenced Labs
# sinatra-secure-password-lab-v-000
# sessions_controller_lab-v-000
