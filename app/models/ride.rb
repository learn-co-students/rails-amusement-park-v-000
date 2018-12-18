
class Ride < ActiveRecord::Base
   belongs_to :attraction
   belongs_to :user

   def take_ride
     if ride_user.tickets < ride_attraction.tickets && ride_user.height < ride_attraction.min_height
       sitrep = "too poor and short"
     elsif ride_user.tickets < ride_attraction.tickets
       sitrep = "too poor"
     elsif ride_user.height < ride_attraction.min_height
       sitrep = "too short"
     else
       update_user_after_ride

     end

     case sitrep
     when "too poor and short"
      "Sorry. You do not have enough tickets the #{ride_attraction.name}. You are not tall enough to ride the #{ride_attraction.name}."
     when "too poor"
       "Sorry. You do not have enough tickets the #{ride_attraction.name}."
     when "too short"
       "Sorry. You are not tall enough to ride the #{ride_attraction.name}."
    else
       "Thanks for riding the #{self.attraction.name}!"
     end


   end

   def update_user_after_ride
     ride_user.tickets = ride_user.tickets - ride_attraction.tickets
     ride_user.nausea += ride_attraction.nausea_rating
     ride_user.happiness += ride_attraction.happiness_rating
     ride_user.save

   end

   def ride_user
      self.user
   end

   def ride_attraction
      self.attraction
   end
end
