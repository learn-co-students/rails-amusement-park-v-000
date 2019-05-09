require 'pry'
class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
     self.user.tickets < self.attraction.tickets ? "Sorry. You do not have enough tickets to ride the #{attraction.name}." : nil 
    #  self.user.height >= self.attraction.min_height ? "Sorry. You are not tall enough to ride the #{attraction.name}." : nil 
    end
end
