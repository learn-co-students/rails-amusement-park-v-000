class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # def mood
  #   binding.pry
  #   # returns 'sad' when the user is more nauseous than happy
  #       if nauseous > happy
  #               puts "sad"
  #       else
  #           puts "happy"
  #       # returns 'happy' when the user is more happy than nauseous
  #       end
  #   end
end
