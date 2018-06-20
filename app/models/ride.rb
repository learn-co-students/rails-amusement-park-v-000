class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  validates :user_id, presence: true
  validates :attraction_id, presence: true


  def take_ride
    @user = self.user
      #we need this method to update the current users info. but we cannot call current_user in this method(because we are in the model)..we could pass the current_user?
    attraction = Attraction.find_by(id: self.attraction_id)
    #binding.pry
    #if not enough tickets - responds with "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    #if not tall enough - "Sorry. You are not tall enough to ride the #{attraction.name}."
    #if too short and broke - both messages combined
    #updates ticket number(subtract), nauseau(add nauseau rating) and happiness (adds rating)
    if too_short? && too_broke?
      "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
    elsif too_broke?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif too_short?
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      self.user.nausea += attraction.nausea_rating
      self.user.tickets -= attraction.tickets
      self.user.happiness += attraction.happiness_rating
      self.user.save
      "Thanks for riding the #{attraction.name}!"
    end

  end

  def too_short?
    attraction = Attraction.find_by(id: self.attraction_id)
    #binding.pry
    self.user.height < attraction.min_height
  end

  def too_broke?
    attraction = Attraction.find_by(id: self.attraction_id)
    self.user.tickets - attraction.tickets < 0
  end





end
