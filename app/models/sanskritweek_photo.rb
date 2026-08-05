class SanskritweekPhoto < ApplicationRecord
  belongs_to :sanskritweek_past_event, foreign_key: :past_event_id
  has_one_attached :image

  validates :image, presence: true
end