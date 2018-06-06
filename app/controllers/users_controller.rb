class UsersController < ApplicationController

  # NOTE : Currently at building out the users_features_spec methods and views

  # Sign Up Page
  def new
    if logged_in?
      flash[:notice] = "You are already signed in. If this is not your account, please 'Log Out'."
      # session[:error_message] = "You are already signed in. If this is not your account, please 'Log Out'."
      redirect_to "/users/#{current_user.id}"
    else
      @new_user = User.new
    end
  end

  # Create Action
  def create
    user = User.new(user_params)
		if user.save
      session[:user_id] = user.id
      # session[:error_message] = ""
      redirect_to user_path(user)
		else
      # session[:error_message] = "Something went wrong during sign up, please try again."
      flash[:notice] = "Something went wrong during sign up, please try again."
			redirect_to new_user_path
		end
  end

  # Profile Page
  def show
    redirect_if_not_logged_in
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end

end

# rspec spec/features/users_features_spec.rb --format d
# rspec spec/support/login_helper.rb --format d

# Referenced Labs
# Sinatra Project -- nnktoo
# sinatra-secure-password-lab-v-000
# sessions_controller_lab-v-000
# partial-locals-lab-v-000
# login_required_lab-v-000
# forms-and-basic-associations-rails-lab-v-000
