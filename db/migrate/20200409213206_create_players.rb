class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|  

      t.string :name 
      t.string :date_of_birth
      

      t.timestamps
    end
  end
end
