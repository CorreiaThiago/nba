class Participant < ActiveRecord::Base
  belongs_to :game
  belongs_to :team
  has_many :statistics
  has_many :players, through: :statistics

  scope :home, -> {where(homeaway: 'H')}
  scope :away, -> {where(homeaway: 'A')}
  scope :win, -> {where(winloss: 'W')}
  scope :loss, -> {where(winloss: 'L')}
end
