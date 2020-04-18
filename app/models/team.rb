class Team < ApplicationRecord
    
    has_many :players 
    has_many :users, through: :players 

    validates :town, :presence => true 
    validates :color, :presence => true 
    validates :age_group, :presence => true  

    def players_attributes=(players_attributes) 
        player.attributes.each do |player_attribute|
            player = Player.find_or_create_by(player_attribute) 
            self.players << player 
        end 
    end 
end
