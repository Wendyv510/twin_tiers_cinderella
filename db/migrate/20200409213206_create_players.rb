class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.integer :user_id 
      t.integer :team_id 

      t.string :name 
      t.integer :age 
      

      t.timestamps
    end
  end
end
