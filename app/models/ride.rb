class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  validates :user_id, presence: true
  validates :attraction_id, presence: true


  def take_ride(attraction)
    #if not enough tickets - responds with "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    #if not tall enough - "Sorry. You are not tall enough to ride the #{attraction.name}."
    #if too short and broke - both messages combined
    #updates ticket number(subtract), nauseau(add nauseau rating) and happiness (adds rating)
    if too_short? && too_broke?
      "Sorry. You are not tall enough to ride the #{@attraction.name}."
    elsif too_broke?
      "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
    elsif too_short?
      "Sorry. You are not tall enough to ride the #{@attraction.name}."
    else
      "Thanks for riding the #{@attraction.name}!"
    self.nausea += @attraction.nausea_rating
    self.tickets -= @attraction.attraction.tickets
    self.happiness += @attraction.happiness_rating

  end

  def too_short?
    self.user.height < self.attraction.min_height
  end

  def too_broke?
    self.user.tickets - self.attraction.tickets < 0
  end





end
