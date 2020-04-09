class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :town 
      t.string :color 
      t.integer :age_group 

      t.timestamps
    end
  end
end
