class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.references :game, index: true
      t.references :team, index: true
      t.references :player, index: true
      t.boolean :starter #array lists position if starter, blank if not, test it
      t.integer :time_played #in seconds, method will be written to convert it
      t.integer :twostaken
      t.integer :twosmade
      t.integer :threestaken
      t.integer :threesmade
      t.integer :freesmade
      t.integer :freestaken
      t.integer :oreb
      t.integer :dreb
      t.integer :assists
      t.integer :turnovers
      t.integer :seals
      t.integer :blocks
      t.integer :fouls
      t.integer :plusminus
      t.timestamps null: false
    end
    add_foreign_key :statistics, :games
    add_foreign_key :statistics, :players
    add_foreign_key :statistics, :teams
  end
end
