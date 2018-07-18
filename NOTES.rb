USER is valid with a name, password, happiness, nausea, height, and tickets (FAILED - 55)


  self.user.tickets -= self.attraction.tickets
  self.user.nausea += self.attraction.nausea_rating
  self.user.happiness += self.attraction.happiness_rating
  self.user.save
