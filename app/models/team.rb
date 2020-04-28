class Team < ApplicationRecord
    
    belongs_to :user 
    has_many :players, through: :player_teams 

    validates :town, :presence => true 
    validates :color, :presence => true 
    validates :age_group, :presence => true  

    def players_attributes=(players_attributes) 
        player.attributes.each do |player_attribute|
            player = Player.find_or_create_by(player_attribute) 
            self.players << player 
        end 
    end 

    def self.by_town(town)
        where(town: town) 
    end 
end
