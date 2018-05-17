class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def tall_enough?(user,attraction)
    true unless user.height < attraction.min_height
  end

  def tickets_enough?(user,attraction)
    true unless user.tickets < attraction.tickets
  end

  def take_ride
    @user = User.find(self.user_id)
    @attraction = Attraction.find(self.attraction_id)

    if !tickets_enough?(@user,@attraction)
      @response = "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
    end

    if !tall_enough?(@user,@attraction)
      @response = "Sorry. You are not tall enough to ride the #{@attraction.name}."
    end

    if !tall_enough?(@user,@attraction) && !tickets_enough?(@user,@attraction)
      @response = "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
    end

    if tall_enough?(@user,@attraction) && tickets_enough?(@user,@attraction)
      @user.ticket_count(@attraction)
      @user.nausea_update(@attraction)
      @user.happiness_update(@attraction)
      @user.save
      @response = "Thanks for riding the #{@attraction.name}!"
    end
    @response
  end
end
