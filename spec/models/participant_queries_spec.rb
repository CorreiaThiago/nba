require 'rails_helper'

RSpec.describe Participant, type: :model do

	before { system 'psql -d nba_test -f spec/dumps/query_data_source.sql' }

	scenario "Finding the opponent works" do

		expect(Participant.last.opponent).to eq "Lakers"
	end

end
