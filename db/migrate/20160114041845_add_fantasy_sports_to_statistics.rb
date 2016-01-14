class AddFantasySportsToStatistics < ActiveRecord::Migration
  def change
    add_column :statistics, :fd, :float
    add_column :statistics, :dk, :float
    add_column :statistics, :yh, :float
  end
end
