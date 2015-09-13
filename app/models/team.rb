class Team < ActiveRecord::Base
  belongs_to :division
  has_many :participants	
  validates :nbacomid, uniqueness: true
end
