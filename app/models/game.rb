class Game < ActiveRecord::Base
	validates :nbacomid, uniqueness: true
	has_many :participants
end
