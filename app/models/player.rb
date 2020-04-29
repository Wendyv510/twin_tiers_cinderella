class Player < ApplicationRecord
     
     has_many :player_teams  
     has_many :teams, through: :player_teams   

     validates :name, :presence => true 
     validates :date_of_birth, :presence => true 

     def player_team_attributes=(player_team_attributes) 
          player_team.attributes.each do |player_team_attribute|
              player_team = Player_team.find_or_create_by(player_team_attribute) 
              self.player_teams << player_team 
          end 
      end 
end
