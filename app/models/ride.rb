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
    #the Ride instance knows who it's user is and who it's attraction is
    #accounts for the user not having enough tickets
    #accounts for the user not being tall enough
    #accounts for the user not being tall enough and not having enough tickets
    #updates ticket number
    #updates the user's nausea
    #updates the user's happiness
    @user = User.find(self.user_id)
    @attraction = Attraction.find(self.attraction_id)
    @response = ""

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
      @user.mood_change
      @user.nausea_update(@attraction)
      @user.happiness_update(@attraction)
    end


    @response
  end
end
