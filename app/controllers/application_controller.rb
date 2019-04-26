class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

 #  before action
 #  check if user is logged in but only do this method to the show page
 # inside helper method
 #  	redirect to root

    # def require_login
    #   # binding.pry
    #   if session.include? :user_id
    #     @user = User.find_by(params[:user_id])
    #     redirect_to user_path(@user)
    #   else
    #     redirect_to '/'
    #   end
    #   redirect_to '/' unless session.include? :user_id
    # end

    def require_login
      redirect_to '/' unless session.include? :user_id
    end



end
