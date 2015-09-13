class ChangeHomawayToHomeaway < ActiveRecord::Migration
  def up
  	rename_column :participants, :homaway, :homeaway
  end

  def down
  	rename_column :participants, :homeaway, :homaway
  end
end
