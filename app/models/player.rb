class Player < ApplicationRecord
     belongs_to :coach 
     belongs_to :team 

     validates :name, :presence => true 
     validates :age, :presence => true 
end
