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

	scenario "Expec the third place team in the Central Division to have be the Chicago Bulls" do
		within ("div#central div[data-place='2']") do
			expect(page).to have_content("Chicago Bulls")
		end
	end

	scenario "Expect the second place team in the southeast division to have 11 wins" do
		within("div#southeast-1 div.wins") do
			expect(page).to have_content("11")
		end
	end

	scenario "Expect the last places team in the atlantic to have 18 losses" do
		within("div#atlantic-4 div.losses") do
			expect(page).to have_content("18")
		end
	end

	scenario "Expect the fourth place team of the Souteheast Divsion to have the winning percentage .529" do
		within("div#southeast-3 div.winpct") do
			expect(page).to have_content("0.529")
		end
	end

	scenario "Expect the first place team in the Central Division to have '--' in the games behind listing" do
		within("div#central-0 div.gb") do
			expect(page).to have_content("--")
		end
	end

	scenario "Expect the third place team in the Atlantic division to have 3 in the games behind listing" do
		within("div#atlantic-2 div.gb") do
			expect(page).to have_content("3")
		end
	end

	scenario "Expect the last place team in the central Divsion to have 7 1/2 as the games behind listing" do
		within("div#central-4 div.gb") do
			expect(page).to have_content("7 1/2")
		end
	end
end