class Ride < ActiveRecord::Base
	belongs_to :user
	belongs_to :attraction

	def take_ride
		if user.tickets < attraction.tickets && user.height < attraction.min_height
			"Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
		elsif user.tickets < attraction.tickets
			"Sorry. You do not have enough tickets to ride the #{attraction.name}."
		elsif user.height < attraction.min_height
			"Sorry. You are not tall enough to ride the #{attraction.name}."
		else
			attraction.min_height
			user.tickets -= attraction.tickets
			user.nausea += attraction.nausea_rating
			user.happiness += attraction.happiness_rating
			user.save
		end
	end
end

# it "has a method 'take_ride' that accounts for the user not having enough tickets" do
#     ride = Ride.create(:user_id => user.id, :attraction_id => attraction.id)
#     expect(ride.take_ride).to eq("Sorry. You do not have enough tickets to ride the #{attraction.name}.")
#     expect(user.tickets).to eq(4)
#     expect(user.happiness).to eq(3)
#     expect(user.nausea).to eq(5)
#   end