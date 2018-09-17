class RidesController < ApplicationController

  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
    @ride.take_ride
    redirect_to user_path(@ride.user)
  end

  private

  def take_ride
    @user = self.user
    @attraction = self.attraction
    if (@user.height < @attraction.min_height) && (@user.tickets < @attraction.tickets)
      return "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
    elsif @user.tickets < @attraction.tickets
      return "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
    elsif @user.height < @attraction.min_height
      return "Sorry. You are not tall enough to ride the #{@attraction.name}."
    else
      @new_tickets = (@user.tickets - @attraction.tickets)
      @new_nausea = (@user.nausea + @attraction.nausea_rating)
      @new_happiness = (@user.happiness + @attraction.happiness_rating)
      @user.update(:tickets => @new_tickets, :nausea => @new_nausea, :happiness => @new_happiness)
    end
  end


end
