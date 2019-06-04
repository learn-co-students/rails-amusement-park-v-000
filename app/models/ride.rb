class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :attraction

  def take_ride
    user = User.find(user_id)
    attraction = Attraction.find(attraction_id)
    result = []
    final = ""

    # tickets
    user_tickets = user.tickets
    attraction_tickets = attraction.tickets

    # height
    user_height = user.height
    attraction_min_height = attraction.min_height

    # happiness
    user_happiness = user.happiness
    attraction_happiness_rating = attraction.happiness_rating

    # nausea
    user_nausea = user.nausea
    attraction_nausea_rating = attraction.nausea_rating

    if enough_tickets?(user_tickets, attraction_tickets)
    else
      result << "You do not have enough tickets to ride the #{attraction.name}."
    end

    if tall_enough?(user_height, attraction_min_height)
    else
      result << "You are not tall enough to ride the #{attraction.name}."
    end

    if result.size > 0
      result = result.unshift("Sorry.")
      final = result.join(" ")
    else
      updated_user_tickets = (user_tickets.to_i - attraction_tickets.to_i)
      updated_user_happiness = (user_happiness.to_i + attraction_happiness_rating.to_i)
      updated_user_nausea = (user_nausea.to_i + attraction_nausea_rating.to_i)

      user.update(tickets: updated_user_tickets, nausea: updated_user_nausea, happiness: updated_user_happiness)
    end

    final
  end

  def tall_enough?(user_height, attraction_height)
    user_height >= attraction_height ? true : false
  end

  def enough_tickets?(user_tickets, attraction_tickets)
    user_tickets >= attraction_tickets ? true : false
  end
end
