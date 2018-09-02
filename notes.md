Attraction
name, min_height, nausea_rating, happiness_rating, and ticket number
has_many :rides
has_many :users, through: :rides

rails g model Attraction name:string nausea_rating:integer happiness_rating:integer tickets:integer min_height:integer --no-test-framework



User
name, password_digest, happiness, nausea, height, and tickets
has_many :rides
has_many :attractions, through: :rides

rails g model User name:string password_digest:integer nausea:integer happiness:integer tickets:integer height:integer --no-test-framework

rails g migration AddAdminColumnToUsersTable Users admin:boolean --no-test-framework

rails g migration change_password_digest_to_be_string_in_users --no-test-framework



Ride
user_id, attraction_id
belongs_to :attraction
belongs_to :user


rails g model Ride user_id:integer attraction_id:integer --no-test-framework





<%= form_for @user, url: signin_path(@user) do |f| %>
  <%= f.label :name %>
  <%= f.text_field :name %><br>
  <%= f.label :password %>
  <%= f.password_field :password %><br>
  <%= f.submit "Sign In"%>
<% end %>
