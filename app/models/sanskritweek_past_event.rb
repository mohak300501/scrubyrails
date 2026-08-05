class SanskritweekPastEvent < ApplicationRecord
  has_many_attached :photos
  has_many :sanskritweek_photos, foreign_key: :past_event_id, dependent: :destroy

  validates :year,  presence: true
  validates :title, presence: true

  default_scope { order(year: :desc) }
end