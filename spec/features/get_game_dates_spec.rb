require 'rails_helper'

RSpec.feature "Getting the NBA game information from a given date" do

  scenario "Entering a date that has games" do
    visit "/"
    select "2014", from: "game_date_year"
    select "October", from: "game_date_month"
    select "31", from: "game_date_day"
    click_button "Get Games"
    expect(page).to have_content("We are getting the games")
    expect(page).to have_content("Search Date: 10/31/2014")
    expect(page).to have_content("6 games on this date")
  end

  scenario "Entering a date that has no games" do
  	visit "/"
    select "2014", from: "game_date_year"
    select "December", from: "game_date_month"
    select "24", from: "game_date_day"
    click_button "Get Games"
    expect(page).to have_content("There were no games on the selected date")
    expect(page).to_not have_content("games on this date")
  end

end