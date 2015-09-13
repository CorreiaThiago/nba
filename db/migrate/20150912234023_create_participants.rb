class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.references :game, index: true
      t.references :team, index: true
      t.string :homaway
      t.string :winloss
      t.integer :points

      t.timestamps null: false
    end
    add_foreign_key :participants, :games
    add_foreign_key :participants, :teams
  end
end
