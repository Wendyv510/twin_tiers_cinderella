class PlayerTeam < ApplicationRecord

    belongs_to :team 
    belongs_to :player 

     validates :position, :presence => true 
     validates :year, :presence => true
     

end
