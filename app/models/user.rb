require 'pry'


class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  has_secure_password


  def mood

    #binding.pry
    #sad if more nauseus than happy
    #happy if more happy than nauseus

    if self.happiness > self.nausea
      'happy'
    else
      "sad"
    end

  end



end
