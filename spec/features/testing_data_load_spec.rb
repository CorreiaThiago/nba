require 'rails_helper'
#require 'spec/support/load_test_data'

RSpec.feature "Testing the load of the test data" do

	before { system 'psql -d nba_test -f spec/dumps/test.sql' }
	

	scenario "Game Count equals 17" do
		expect(Game.count).to eq(17)
	end

	scenario "Participant count equals 34" do
		expect(Participant.count).to eq(34)
	end

	scenario "Statistic Count equals 368" do
		expect(Statistic.count).to eq(368)
	end

	scenario "Player Count equals 316" do
		expect(Player.count).to eq(316)
	end
end