class ChangeNbaComIdtoString < ActiveRecord::Migration
  def up
  	change_column :games, :nbacomid, :string
  end

  def down
  	change_column :games, :nbacomid, :integer
  end
end
