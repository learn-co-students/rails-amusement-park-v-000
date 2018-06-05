class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.nausea > self.happiness
      "sad"
    else
      "happy"
    end
  end

end


# rspec spec/models/user_spec.rb
# rspec spec/models/ride_spec.rb
# rspec spec/models/attraction_spec.rb

# rspec spec/features/users_features_spec.rb


# rails g resource User name:string password_digest:string nausea:integer happiness:integer tickets:integer height:integer admin:boolean --no-test-framework
# rails destroy resource User
