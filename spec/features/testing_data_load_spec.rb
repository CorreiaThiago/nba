require 'rails_helper'
#require 'spec/support/load_test_data'

RSpec.feature "Testing the load of the test data" do

	system 'psql -d nba_test -f spec/dumps/test.sql'

	scenario "Test Data Loads Properly" do

		expect(Game.count).to eq(17)
		expect(Participant.count).to eq(34)
		expect(Statistic.count).to eq(368)
		expect(Player.count).to eq(299)
	end
end