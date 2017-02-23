class Division < ActiveRecord::Base
	validates :conference, presence: true, inclusion: { in: %w(Eastern Western)}
	validates :name, uniqueness: { case_sensitive: false }
  has_many :teams

  scope :eastern, -> {where(conference: 'Eastern')}
  scope :western, -> {where(conference: 'Western')}

end
