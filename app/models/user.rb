class User < ApplicationRecord
    has_secure_password 

    has_many :teams 
    has_many :players, through: :teams 

    validates :name, :email, :presence => true 
    validates :email, :name, :uniqueness => true 

    def self.find_or_create_by_omniauth(auth) 
        oauth_email = auth["info"]["email"] || auth["info"]["name"]
        self.where(:email => oauth_email).first_or_create do |user| 
            user.password = SecureRandom.hex 
        end 
    end 
    
    
end
