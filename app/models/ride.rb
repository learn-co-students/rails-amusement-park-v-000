class Ride < ActiveRecord::Base
belongs_to :user
belongs_to :attraction

attr_accessor :flash_notice
  def take_ride
    @attraction = Attraction.find(self.attraction_id)
    @user = User.find(self.user_id)
  if @user.tickets < @attraction.tickets && @user.height < @attraction.min_height
      self.flash_notice = "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
  elsif @user.tickets < @attraction.tickets
      self.flash_notice = "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
  elsif @user.height < @attraction.min_height
      self.flash_notice = "Sorry. You are not tall enough to ride the #{@attraction.name}."
  else
      @user.tickets = @user.tickets - @attraction.tickets
      @user.nausea = @user.nausea + @attraction.nausea_rating
      @user.happiness = @user.happiness + @attraction.happiness_rating
      @user.save
      self.flash_notice = "Thanks for riding the #{@attraction.name}!"
    end
  end
end
