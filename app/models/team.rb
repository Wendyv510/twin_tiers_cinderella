class Team < ApplicationRecord
    has_many :players 
    has_many :users, through: :players 

    validates :town, :presence => true 
    validates :color, :presence => true 
    validates :age_group, :presence => true  
end
