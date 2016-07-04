class ChangeDefaultValueOnSchoolsToNaInPlayers < ActiveRecord::Migration
  def up
    change_column_default :players, :school, "N/A"
  end

  def down
    change_columnd_default :players, :school, nil
  end
end
