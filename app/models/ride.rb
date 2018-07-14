class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    @user = self.user
    @attraction = self.attraction
    if @user.height < @attraction.min_height && @user.tickets < @attraction.tickets
      flash[:ride_success] = "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
    elsif @user.height < @attraction.min_height
      flash[:too_short] = "Sorry. You are not tall enough to ride the #{@attraction.name}."
    elsif @user.tickets < @attraction.tickets
      flash[:too_few_tickets] = "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
    else
      @user.tickets = @user.tickets - @attraction.tickets
      binding.pry
      @user.nausea = @user.nausea - @attraction.nausea_rating
      @user.happiness = @user.happiness - @attraction.happiness_rating
      @user.save
    end
  end
end
