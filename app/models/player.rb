class Player < ApplicationRecord
     belongs_to :user 
     belongs_to :team 

     validates :name, :uniqueness, :presence => true 
     validates :age, :presence => true 
end
