class Participant < ActiveRecord::Base
  belongs_to :game
  belongs_to :team
  has_many :statistics
  has_many :players, through: :statistics
end
