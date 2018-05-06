module AttractionsHelper
  def attraction_mood(user, attraction)
    if (user.happiness + attraction.happiness_rating) > (user.nausea + attraction.nausea_rating)
      return "happy"
    else
      return "sad"
    end
  end

end
