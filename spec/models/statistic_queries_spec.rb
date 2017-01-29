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
end