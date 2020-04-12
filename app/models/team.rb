class Team < ApplicationRecord
    belongs_to :user 
    has_many :players 

    validates :town, :presence => true 
    validates :color, :presence => true 
    validates :age_group, :presence => true  
end
