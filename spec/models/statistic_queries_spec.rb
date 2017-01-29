require 'rails_helper'

RSpec.describe Statistic, type: :model do

	context "Testing the Statistic Queries with Sample Data" do
		
		before { system 'psql -d nba_test -f spec/dumps/query_data_source.sql' }

		scenario "League wide Two Point Percentage Calculation Should Work" do
			expect(Statistic.league_averages("twos")).to be_within(0.001).of(47.93)
		end

		scenario "League wide Three Point Percentage Calculation Should Work" do
			expect(Statistic.league_averages("threes")).to be_within(0.001).of(34.91)
		end

		scenario "League wide Free Throws Percentage Calculation Should Work" do
			expect(Statistic.league_averages("frees")).to be_within(0.001).of(76.07)
		end
	end






end