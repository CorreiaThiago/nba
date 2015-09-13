class ChangeGamedateToDateType < ActiveRecord::Migration
  def up
  	change_column :games, :gamedate, :date
  end

  def down
  	change_colum :games, :gamedate, :datetime
  end
end
