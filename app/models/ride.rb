class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    #accounts for user not having enough tickets
    #accounts fo user not being tall enough
    #accounts for both of the above

    #updates ticket number
    #updates user's nausea
    #updates users
  end


end
