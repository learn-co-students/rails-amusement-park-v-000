class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user


  def take_ride
    if user.tickets < self.tickets && user.height < self.min_height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < self.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif user.height < self.min_height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif user.tickets >= self.tickets
      ticket_balance = user.tickets
      new_balance = ticket_balance - self.tickets
      user.tickets = new_balance
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
