class AddParticipantIdToStatistic < ActiveRecord::Migration
  def change
    add_reference :statistics, :participant, index: true
    add_foreign_key :statistics, :participants
    remove_reference :statistics, :game
    remove_reference :statistics, :team
  end
end
