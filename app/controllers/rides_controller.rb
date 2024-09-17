class RidesController < ApplicationController
    def new   
    end

    def create 
        #PJ Wickwire says create is better for crud syntax
        @ride = Ride.create(ride_params)
        #dominque said that the ride gets created first THEN gets redirected to user show page
        #due to post user not being able to access different show pages
        #byebug
        flash[:message] = @ride.take_ride
        redirect_to user_path(@ride.user)
        #valerie said new is needed only, and button_to is a mini form with a single button 
        #https://apidock.com/rails/ActionView/Helpers/UrlHelper/button_to
    end

=begin 
    <%= button_to "Go on this ride", user_path(@user)%>
    <%= button_to "Go on this ride", create_ride_path(@ride)%>

    <%= form_for :ride do |f| %>
    <%= f.hidden_field :user_id %>
    <%= f.hidden_field :attraction_id %>
    <%= f.submit "Go on this ride" %>
    <%end%>

    changed to 

      <%= form_for @ride do |f| %>
    <%= f.hidden_field :user_id %>
    <%= f.hidden_field :attraction_id %>
    <%= f.submit "Go on this ride" %>
    <%end%>

      <%= form_for(@ride) do |f| %>
    <%= f.hidden_field :user_id %>
    <%= f.hidden_field :attraction_id %>
    <%= f.submit "Go on this ride" %>
    <%end%>

=end

def edit 
end

def update
end


    private 

        def ride_params
         params.require(:ride).permit(:user_id, :attraction_id)
        end
end