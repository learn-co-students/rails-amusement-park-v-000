class Attraction < ApplicationRecord
  has_many :rides
  has_many :users, through: :rides

end


# rspec spec/models/attraction_spec.rb


# rails g resource Attraction name:string tickets:integer nausea_rating:integer happiness_rating:integer min_height:integer --no-test-framework
# rails destroy resource Attraction
