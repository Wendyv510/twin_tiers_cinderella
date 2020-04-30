class PlayerTeam < ApplicationRecord

    belongs_to :team 
    belongs_to :player 

     validates :position, :presence => true 
     validates :year, :presence => true
     validates :player_id, :presence => true 
     validates :team_id, :presence => true  

end
