class RidesController < ApplicationController

  def create
    attraction = Attraction.find(params[:ride][:attraction_id])
    user = User.find(session[:user_id])

    if user.tickets < attraction.tickets && user.height < attraction.min_height
        flash[:notice] = "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        redirect_to "/users/#{user.id}"
    elsif user.tickets < attraction.tickets
        flash[:notice] = "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        redirect_to "/users/#{user.id}"	
    elsif user.height < attraction.min_height
        flash[:notice] = "You are not tall enough to ride the #{attraction.name}!"
        redirect_to "/users/#{user.id}"
    else		
        Ride.create(:attraction_id => attraction.id, :user_id => user.id)
        user.tickets -= attraction.tickets
        user.nausea += attraction.nausea_rating
        user.happiness += attraction.happiness_rating

        user.save
        flash[:notice] = "Thanks for riding the #{attraction.name}!"
        redirect_to "/users/#{user.id}"
    end
  end
end