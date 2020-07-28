class Item < ActiveRecord::Base
    belongs_to :food
    
    validates :item_1, :presence => true, :uniqueness => true
    
end
