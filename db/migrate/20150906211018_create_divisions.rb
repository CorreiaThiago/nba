class CreateDivisions < ActiveRecord::Migration
  def change
    create_table :divisions do |t|
      t.text :name
      t.text :conference

      t.timestamps null: false
    end
  end
end
