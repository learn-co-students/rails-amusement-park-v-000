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
    byebug
    @user = User.find(self.user_id)
    @attraction = Attraction.find(self.attraction_id)
    @response = ""

    if !tickets_enough?(@user,@attraction)
      @response = "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
    end


    @response
  end
end
