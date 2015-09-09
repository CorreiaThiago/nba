class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.text :city
      t.text :nickname
      t.text :abbreviation
      t.integer :nbacomid
      t.references :division, index: true

      t.timestamps null: false
    end
    add_foreign_key :teams, :divisions
  end
end
