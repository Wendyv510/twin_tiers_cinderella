class Player < ApplicationRecord
     
     has_many :teams  
     has_many :teams, through: :player_teams   

     validates :name, :presence => true 
     validates :d.o.b, :presence => true 

     def player_team_attributes=(player_team_attributes) 
          player_team.attributes.each do |player_team_attribute|
              player_team = Player_team.find_or_create_by(player_attribute) 
              self.player_teams << player_team 
          end 
      end 
end
