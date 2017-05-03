require 'rails_helper'

RSpec.describe Statistic, type: :model do
	
	before { system 'psql -d nba_test -f spec/dumps/query_data_source.sql' }

	scenario "League wide Two Point Percentage Calculation Should Work" do
		expect(Statistic.averages("twos")).to be_within(0.001).of(47.93)
	end

	scenario "League wide Three Point Percentage Calculation Should Work" do
		expect(Statistic.averages("threes")).to be_within(0.001).of(34.91)
	end

	scenario "League wide Free Throws Percentage Calculation Should Work" do
		expect(Statistic.averages("frees")).to be_within(0.001).of(76.07)
	end


	context "Calculating a players information" do

		let(:otto) {Player.first.statistics}

		scenario "Otto Porters Two Point Percentage Calculation should work" do
			expect(otto.averages("twos")).to be_within(0.001).of(55.95)
		end

		scenario "Otto Porters Three Point Percentage Calculation should work" do
			expect(otto.averages("threes")).to be_within(0.001).of(29.41)
		end

		scenario "Otto Porters Free Throw Percentage Calculation should work" do
			expect(otto.averages("frees")).to be_within(0.001).of(87.88)
		end
	end

	context "Home Scope will yield the right information" do

		let(:home) {Statistic.home}

		scenario "It should have the right amount of records" do
			expect(home.count).to eq 2716
		end

		scenario "It should work on the points testing" do
			expect(home.averages("twos")).to be_within(0.001).of(48.16)
		end
	end

	context "Away scope will yield the right information" do
		let(:away) {Statistic.away}

		scenario "It should have the right amount of records" do
			expect(away.count).to eq 2710
		end

		scenario "It should work on the averages testing" do
			expect(away.averages("frees")).to be_within(0.001).of(76.50)
		end
	end

	context "Team Scope will yield the right information" do
		let(:team) {Statistic.team('PHI')}

		scenario "It should have the right amount of records" do
			expect(team.count).to eq 179
		end

		scenario "It should have the right amount of home statistics" do
			expect(team.home.averages("twos")).to be_within(0.001).of(47.21)
			expect(team.home.averages("threes")).to be_within(0.001).of(29.48)
			expect(team.home.averages("frees")).to be_within(0.001).of(64.81)
		end

		scenario "It should have the right amount of away statistics" do
			expect(team.away.averages("twos")).to be_within(0.001).of(45.21)
			expect(team.away.averages("threes")).to be_within(0.001).of(33.22)
			expect(team.away.averages("frees")).to be_within(0.001).of(76.13)
		end
	end


end