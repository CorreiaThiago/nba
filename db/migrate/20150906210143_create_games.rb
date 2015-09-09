class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :nbacomid
      t.datetime :gamedate

      t.timestamps null: false
    end
  end
end
