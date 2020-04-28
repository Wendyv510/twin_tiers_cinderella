class Team < ApplicationRecord
    
    belongs_to :user

    has_many :player_teams   
    has_many :players, through: :player_teams

    validates :town, :presence => true 
    validates :color, :presence => true 
    validates :age_group, :presence => true  

    def player_team_attributes=(player_team_attributes) 
        player_team.attributes.each do |player_team_attribute|
            player_team = Player_team.find_or_create_by(player_team_attribute) 
            self.player_teams << player_team 
        end 
    end 

    def self.by_town(town)
        where(town: town) 
    end 
end
