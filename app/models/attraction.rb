<<<<<<< HEAD
class Attraction < ActiveRecord::Base
=======
class Attraction < ApplicationRecord
>>>>>>> 63d5bce3d95950b032993ffd470b136d5b3b8206
  has_many :rides
  has_many :users, through: :rides
end
