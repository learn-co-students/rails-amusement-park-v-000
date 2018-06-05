class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    notice = ""
    set_variables
    if !check_tickets && !check_height
      notice = "Sorry. You do not have enough tickets to ride the #{@ride_attraction.name}. You are not tall enough to ride the #{@ride_attraction.name}."
    elsif !check_tickets
      notice = "Sorry. You do not have enough tickets to ride the #{@ride_attraction.name}."
    elsif !check_height
      notice = "Sorry. You are not tall enough to ride the #{@ride_attraction.name}."
    end

    notice
  end

  private

  def set_variables
    @ride_attraction = self.attraction
    @rider = self.user
    # puts "rider = #{@rider} || attraction = #{@ride_attraction}"
  end

  # User name nausea happiness tickets height admin
  # Attraction name tickets nausea_rating happiness_rating min_height

  # Checks if rider has enough tickets to go on attraction
  def check_tickets
    set_variables
    # puts "CHECK TICKETS => r tickets = #{@rider.tickets} || a tickets = #{@ride_attraction.tickets}"
    if @rider.tickets > @ride_attraction.tickets
      # puts "Rider has enough tickets to ride attraction"
      return true
    end
    # puts "Rider needs more tickets to ride attraction"
    false
  end

  # If rider has enough tickets, updates tickets based on attraction ticket cost
  def update_tickets
    set_variables
    puts "UPDATE RIDER TICKETS => r tickets = #{@rider.tickets} || a tickets = #{@ride_attraction.tickets}"
    @rider.tickets -= @ride_attraction.tickets
    puts "UPDATED RIDER TICKETS => r tickets = #{@rider.tickets}"
  end

  # Checks if rider is tall enough to go on attraction
  def check_height
    set_variables
    # puts "CHECK RIDER HEIGHT => r height = #{@rider.height} || a height = #{@ride_attraction.min_height}"
    if @rider.height > @ride_attraction.min_height
      # puts "Rider is tall enough to ride attraction"
      return true
    end
    # puts "Rider is too short to ride attraction"
    false
  end

  # Updates rider nausea
  def rider_nausea
    set_variables
    puts "CHECK RIDER HEIGHT => r nausea = #{@rider.nausea} || a nausea = #{@ride_attraction.nausea_rating}"
  end

  # Updates rider happiness
  def rider_happiness
    set_variables
    puts "CHECK RIDER HEIGHT => r happiness = #{@rider.happiness} || a happiness = #{@ride_attraction.happiness_rating}"
  end

end


# rspec spec/models/ride_spec.rb --format d



# rails g resource Ride user_id:integer attraction_id:integer --no-test-framework
#   >> Will change both to "belongs_to"
# rails destroy resource Ride
