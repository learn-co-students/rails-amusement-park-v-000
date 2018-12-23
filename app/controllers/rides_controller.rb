class RidesController < ApplicationController

  def take_ride
    @user = current_user
    @attraction = Attraction.find_by_id(params[:attraction_id])
    if ticket_check(@user, @attraction) && height_check(@user, @attraction)
        ride = Ride.new
        ride.user_id = @user.id
        ride.attraction_id = @attraction.id
        ride.save

        @user.update(tickets: @user.tickets - @attraction.tickets,
          happiness: @user.happiness + @attraction.happiness_rating,
        nausea: @user.nausea + @attraction.nausea_rating)
        @user.save

        redirect_to @user

      else
        redirect_to @attraction
      end
    end

    private

    def ticket_check(user, attraction)
      user.tickets >= attraction.tickets
    end

    def height_check(user, attraction)
      !user.height.nil? && user.height >= attraction.min_height
    end


end
