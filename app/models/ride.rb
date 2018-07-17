class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    @user = self.user
    @attraction = self.attraction
    if @user.height < @attraction.min_height && @user.tickets < @attraction.tickets
      #flash[:fail] = "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
    elsif @user.height < @attraction.min_height
      #flash[:too_short] = "Sorry. You are not tall enough to ride the #{@attraction.name}."
    elsif @user.tickets < @attraction.tickets
      #flash[:too_few_tickets] = "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
    else
      #tickets = @user.tickets - @attraction.tickets
      @user.update_attribute(:tickets, (@user.tickets - @attraction.tickets))
      @user.update_attribute(:happiness, (@attraction.happiness_rating + @user.happiness))
      @user.update_attribute(:nausea, (@attraction.nausea_rating + @user.nausea))
      #@user.happiness = @user.happiness - @attraction.happiness_rating
      #flash[:ride_success] = "Thanks for riding #{@attraction.name}!"
    end
  end


end
