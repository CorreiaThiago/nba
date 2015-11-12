class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
    	t.string :nbacomid
    	t.string :fname
    	t.string :lname
    	t.date :birthdate
    	t.string :school
    	t.string :country
    	t.integer :height
    	t.string :position
    	t.integer :rookie_year
      t.timestamps null: false
    end
    add_index :players, :nbacomid, unique: true
  end
end