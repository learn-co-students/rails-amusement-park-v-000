class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction
  # validates_presence_of :user, :attraction
  # before_save :take_ride_or_log_error

  def take_ride_or_log_error
    if result = take_ride
      self.errors.add(:ride_errors, take_ride)
    else
      return nil
    end
  end

  def take_ride

    validate_users_height_and_tickets

    return @error_msg if @error_msg

    take_users_tickets
    update_users_mood

    return nil

  end

  private

  def validate_users_height_and_tickets

    check_tickets_amount
    check_height

    if check_height && check_tickets_amount
      @error_msg = "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    end
  end

  def check_tickets_amount
    return nil if user.tickets >= attraction.tickets

    @error_msg = "Sorry. You do not have enough tickets to ride the #{attraction.name}."
  end

  def check_height
    return nil if user.height >= attraction.min_height

    @error_msg = "Sorry. You are not tall enough to ride the #{attraction.name}."
  end

  def take_users_tickets
    user.tickets -= attraction.tickets
    user.save!
  end

  def update_users_mood
    user.nausea += attraction.nausea_rating
    user.happiness += attraction.happiness_rating
    user.save!
  end

end
