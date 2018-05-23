class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
  end

  def meet_requirements
  end

  def start_ride
  end

  def ticket_issue
  end

  def height_issue
  end
end
