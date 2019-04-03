class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user


  def take_ride

    current_ride = Ride.new(:attraction_id => attraction.id, :user_id => user.id) #somehow link attraction to ride
    
    user.rides << current_ride
    attraction.rides << current_ride

    if user.tickets < attraction.tickets && user.height < attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else #user.tickets >= attraction.tickets && user.height >= attraction.min_height
      new_balance = user.tickets - attraction.tickets
      user.tickets = new_balance

      new_nausea_level = user.nausea + attraction.nausea_rating
      user.nausea = new_nausea_level

      new_happiness_level = user.happiness + attraction.happiness_rating
      user.happiness = new_happiness_level
    end
  end


  # it "has a method 'take_ride' that updates the user's nausea" do
  #   user.update(:tickets => 10)
  #   ride = Ride.create(:user_id => user.id, :attraction_id => attraction.id)
  #   ride.take_ride
  #   mindy = User.find_by(:name => "Mindy")
  #   expect(mindy.nausea).to eq(7)
  # end
  #
  # it "has a method 'take_ride' that updates the user's happiness" do
  #   user.update(:tickets => 10)
  #   ride = Ride.create(:user_id => user.id, :attraction_id => attraction.id)
  #   ride.take_ride
  #   mindy = User.find_by(:name => "Mindy")
  #   expect(mindy.happiness).to eq(7)
  # end
end
