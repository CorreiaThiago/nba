class AddDoublesToStatistics < ActiveRecord::Migration
  def change
    add_column :statistics, :doubles, :integer
  end
end
