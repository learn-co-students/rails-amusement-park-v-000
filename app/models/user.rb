class User < ActiveRecord::Base
  # NOTE : Added for loading slug module
  include Slugifiable

  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.admin == false && self.nausea > self.happiness
      "sad"
    else
      "happy"
    end
  end

end


# rspec spec/models/user_spec.rb --format d
# rspec spec/features/users_features_spec.rb
# rspec spec/support/login_helper.rb


# rails g resource User name:string password_digest:string nausea:integer happiness:integer tickets:integer height:integer admin:boolean --no-test-framework
# rails destroy resource User
