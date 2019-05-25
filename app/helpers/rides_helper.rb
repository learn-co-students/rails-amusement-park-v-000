module RidesHelper

  def enough_tickets
    if self.user.tickets > self.attraction.tickets
      self.user.happiness = self.user.happiness + 1
    else
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    end
  end

  def tall_enough
    if self.user.height > self.attraction.min_height
      self.user.height
    else
      return "Sorry. You are not tall enough to ride the #{attraction.name}."
    end
  end

end
