class Player < ApplicationRecord
      
     has_many :teams, through: :player_teams   

     validates :name, :presence => true 
     validates :d.o.b, :presence => true 
end
