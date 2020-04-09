class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.integer :coach_id 
      t.integer :team_id 

      t.string :name 
      t.integer :age 
      

      t.timestamps
    end
  end
end
