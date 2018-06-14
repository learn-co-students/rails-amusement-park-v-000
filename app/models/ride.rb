class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  validates :user_id, presence: true
  validates :attraction_id, presence: true


  def take_ride
    attraction = Attraction.find_by(id: self.attraction_id)
    #if not enough tickets - responds with "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    #if not tall enough - "Sorry. You are not tall enough to ride the #{attraction.name}."
    #if too short and broke - both messages combined
    #updates ticket number(subtract), nauseau(add nauseau rating) and happiness (adds rating)
    if too_short? && too_broke?
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif too_broke?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif too_short?
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      "Thanks for riding the #{attraction.name}!"
    current_user.nausea += attraction.nausea_rating
    current_user.tickets -= attraction.attraction.tickets
    current_user.happiness += attraction.happiness_rating
    end
  end

  def too_short?
    attraction = Attraction.find_by(id: self.attraction_id)
    current_user.height < attraction.min_height
  end

  def too_broke?
    attraction = Attraction.find_by(id: self.attraction_id)
    current_user.user.tickets - attraction.tickets < 0
  end





end
