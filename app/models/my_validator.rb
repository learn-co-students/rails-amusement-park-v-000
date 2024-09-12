class MyValidator < ActiveModel::MyValidator
  def validate(ride)
    if ride.attraction.min_height > ride.user.height
      record.errors[:height] << "Sorry. You are not tall enought to ride the #{attraction.name}."
    end
    if ride.attraction.tickets > ride.user.tickets
      record.errors[:tickets] << "Sorry. You do not have enough tickets to ride the #{ride.attraction.name}."
    end


    end
  end
end
