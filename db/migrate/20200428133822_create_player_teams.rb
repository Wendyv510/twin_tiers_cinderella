class CreatePlayerTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :player_teams do |t|
      t.string :position 
      t.string :year 
      t.integer :team_id 
      t.integer :player_id 

      t.timestamps
    end
  end
end
