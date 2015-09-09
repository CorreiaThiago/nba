require 'rails_helper'

RSpec.feature "Getting the NBA game information from a given date" do

  scenario "Entering the date" do
    visit "/"
    select "2014", from: "game_date_year"
    select "October", from: "game_date_month"
    select "31", from: "game_date_day"
    click_button "Get Games"
    expect(page).to have_content("We are getting the games")
    expect(page).to have_content("Search Date: 10/31/2014")
  end
end