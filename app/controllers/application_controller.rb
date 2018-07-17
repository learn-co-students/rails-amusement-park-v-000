class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   helper_method :current_user, :logged_in?, :can_you_ride?

    def current_user
      @user ||= session[:user_id]
    end

    def logged_in?
      !!current_user
    end

    def can_you_ride?(params)
      @attraction = Attraction.find(params[:attraction])
      if !set_user.ticket_ride(params)
        flash[:notice] ="You don't have enough tickets to ride #{@attraction.name}!"
      elsif !set_user.tall_enough(params)
        flash[:notice] ="You are not tall enough to ride the #{@attraction.name}!"
      else
        flash[:notice] ="Thanks for riding the #{@attraction.name}!"
      end
    end

    # def current_attraction(id)
    #   @attraction ||= Attraction.find(id)
    # end

end
