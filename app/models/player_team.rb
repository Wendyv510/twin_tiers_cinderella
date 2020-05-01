class PlayerTeam < ApplicationRecord

    belongs_to :team 
    belongs_to :player

    validates :player_id, :uniqueness => {scope: :team_id}
     validates :position, :presence => true 
     validates :year, :presence => true
     

end
