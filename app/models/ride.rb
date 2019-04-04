class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user


  def take_ride

    current_ride = Ride.create(:attraction_id => attraction.id, :user_id => user.id) #somehow link attraction to ride

    user.rides << current_ride
    attraction.rides << current_ride

    if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
      flash[:notice] = "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif self.user.tickets < self.attraction.tickets
      flash[:notice] = "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif user.height < attraction.min_height
      flash[:notice] = "Sorry. You are not tall enough to ride the #{attraction.name}."
    else #user.tickets >= attraction.tickets && user.height >= attraction.min_height

      flash[:notice] = "Thank you for riding the #{attraction.name}."

      new_balance = self.user.tickets - self.attraction.tickets
      self.user.tickets = new_balance

      new_nausea_level = self.user.nausea + self.attraction.nausea_rating
      self.user.nausea = new_nausea_level

      new_happiness_level = self.user.happiness + self.attraction.happiness_rating
      self.user.happiness = new_happiness_level
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
