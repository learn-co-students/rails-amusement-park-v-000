class Ride < ActiveRecord::Base

  validates :user_id, presence: true
  validates :attraction_id, presence: true


  belongs_to :user
  belongs_to :attraction

  def take_ride
    @attraction = Attraction.find(self.attraction_id)
    @user = User.find(self.user_id)
    if @user.tickets < @attraction.tickets && @user.height < @attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
    elsif @user.tickets < @attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
    elsif @user.height < @attraction.min_height
      "Sorry. You are not tall enough to ride the #{@attraction.name}."
    else
      @tickets = @user.tickets - @attraction.tickets
      @nausea = @user.nausea + @attraction.nausea_rating
      @happiness = @user.happiness + @attraction.happiness_rating
      @user.update(tickets: @tickets, nausea: @nausea, happiness: @happiness)
      "Enjoy the Ride!"
    end
  end
end
