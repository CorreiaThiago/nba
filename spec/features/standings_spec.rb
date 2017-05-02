require 'rails_helper'

RSpec.feature "Testing the Standings page" do

	before do 
		system 'psql -d nba_test -f spec/dumps/query_data_source.sql'
		visit standings_path
	end

	scenario "The standings page should have the right date" do
		expect(page).to have_content("League Standings as of November 29, 2015")
	end

	scenario "The eastern conference should come before the western conference" do
		within ("div#standings div[data-conference]:nth-child(1)") do
			expect(page).to have_content("Eastern Conference")
		end
	end

	scenario "The western conference is listed as the second data-conference child" do
		within("div#standings div[data-conference]:nth-child(2)") do
			expect(page).to have_content("Western Conference")
		end
	end

	scenario "The eastern conference divisions are listed in order" do
		within("div#standings div[data-conference='eastern']") do
			within('div[data-division]:nth-of-type(1)') do
				expect(page).to have_content("Atlantic Division")
			end
			within('div[data-division]:nth-of-type(2)') do
				expect(page).to have_content("Central Division")
			end
			within('div[data-division]:nth-of-type(3)') do
				expect(page).to have_content("Southeast Division")
			end
		end
	end 

	scenario "The western conference divisions are listed in order" do
		within("div#standings div[data-conference='western']") do
			within('div[data-division]:nth-of-type(1)') do
				expect(page).to have_content("Northwest Division")
			end
			within('div[data-division]:nth-of-type(2)') do
				expect(page).to have_content("Pacific Division")
			end
			within('div[data-division]:nth-of-type(3)') do
				expect(page).to have_content("Southwest Division")
			end
		end
	end

	scenario "The first place team in the pacific division yields correctly" do
		within('div#pacific-0') do
				expect(page).to have_content("Golden State Warriors")
		end
	end


	scenario "Expect the first place team in the Atlantic Division to be the Toronto Raptors" do
		within("div#atlantic-0") do
			expect(page).to have_content("Toronto Raptors")
		end
	end

	scenario "Expec the third place team in the Central Division to have be the Chicago Bulls" do
		within ("div#central-2") do
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