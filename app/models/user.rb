class User < ApplicationRecord
    has_secure_password 

    has_many :players 
    has_many :teams 

    validates :name, :email, :presence => true 
    validates :email, :name, :uniqueness => true 

    def self.find_or_create_by_omniauth(auth) 
        oauth_email = auth["info"]["email"] || auth["info"]["name"]
        self.where(:email => oauth_email).first_or_create do |user| 
            user.password = SecureRandom.hex 
        end 
    end 

    def players_attributes=(players_attributes) 
        player.attributes.each do |player_attribute|
            player = Player.find_or_create_by(player_attribute) 
            self.players << player 
        end 
    end 
    
    
end
