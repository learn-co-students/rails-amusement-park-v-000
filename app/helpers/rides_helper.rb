module RidesHelper
  def tall_enough?(user_height, attraction_height)
    user_height >= attraction_height ? true : false
  end
  
  def enough_tickets?(user_tickets, attraction_tickets)
    user_tickets >= attraction_tickets ? true : false
  end
end
