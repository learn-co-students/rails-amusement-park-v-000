class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides
  validates :user_id, presence: true
  validates :attraction_id, presence: true



  def mood
    #returns sad when the user is more nauseaous than happy, or happy when the opposite
  end

  def take_ride(attraction)
    #if not enough tickets - responds with "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    #if not tall enough - "Sorry. You are not tall enough to ride the #{attraction.name}."
    #if too short and broke - both messages combined
    #updates ticket number(subtract), nauseau(add nauseau rating) and happiness (adds rating)
    if too_short? && too_broke?
      Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif too_broke?
      Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif too_short?
      Sorry. You are not tall enough to ride the #{attraction.name}."
    end

    self.nauseau += attraction.nausea_rating
    self.tickets -= attraction.tickets
    self.happiness += attraction.happiness_rating



  end

  def too_short?(attraction)
    self.height < attraction.min_height
  end

  def too_broke?(attraction)
    self.tickets - attraction.tickets < 0
  end





end
