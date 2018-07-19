class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   helper_method :current_user, :logged_in?, :can_you_ride?

    def current_user
      @user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
      !!current_user
    end

    def can_you_ride?(params)
      @attraction = Attraction.find(params[:attraction])
      if !current_user.tall_enough(params) && !current_user.ticket_ride(params)
        flash[:notice] ="You are not tall enough to ride the #{@attraction.name}. /n
        You do not have enough tickets to ride the #{@attraction.name}"
      elsif !current_user.ticket_ride(params)
        flash[:notice] ="You do not have enough tickets to ride the #{@attraction.name}"
      elsif !current_user.tall_enough(params)
        flash[:notice] ="You are not tall enough to ride the #{@attraction.name}"
      else
        current_user.nausea = @attraction.nausea_rating
        current_user.happiness = @attraction.happiness_rating
        flash[:notice] ="Thanks for riding the #{@attraction.name}!"
      end
    end


end
