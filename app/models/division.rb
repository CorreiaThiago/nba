class Division < ActiveRecord::Base
	validates :conference, presence: true, inclusion: { in: %w(Eastern Western)}
	validates :name, uniqueness: { case_sensitive: false }
  has_many :teams

  scope :east, -> {where(conference: 'Eastern')}
  scope :west, -> {where(conference: 'Western')}

end
