class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user
    # is this the same as belongs to 1 attraction and 1 user? 
    # should it be has_one? 
    validates :user_id, attraction_id, presence: true

    # def take_ride 
    #   if self.t
    # else
    #     Sorry. You do not have enough tickets to ride the #{attraction.name}.
    # end 
    # end

end

