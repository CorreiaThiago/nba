class RenameSealsTableInStatistics < ActiveRecord::Migration
  def change
    rename_column :statistics, :seals, :steals
  end
end
