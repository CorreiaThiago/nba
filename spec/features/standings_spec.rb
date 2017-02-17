require 'rails_helper'

RSpec.feature "Testing the Standings page" do

	before do 
		system 'psql -d nba_test -f spec/dumps/query_data_source.sql'
		visit standings_path
	end

	scenario "The standings page should have the right data" do
		expect(page).to have_content("League Standings as of November 29, 2015")
	end

	scenario "Expect the first place team in the Atlantic Division to be the Toronto Raptors" do
		within("div#atlantic div[data-place='0']") do
			expect(page).to have_content("Toronto Raptors")
		end
	end
end