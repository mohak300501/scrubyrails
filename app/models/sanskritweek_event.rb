# ===== SANSKRITWEEK EVENT MODEL =====
class SanskritweekEvent < ApplicationRecord

  has_one_attached :poster_image

  validates :title,       presence: true
  validates :description, presence: true
  # poster is required in form but we skip the model validator
  # since active_storage_validations gem is not installed

  scope :by_day,      ->(day) { where(day: day) }
  scope :by_category, ->(cat) { where(category: cat) }

  CATEGORIES = %w[competition workshop cultural lecture].freeze
  STATUSES   = %w[open closed final_round].freeze

end
# ===== END SANSKRITWEEK EVENT MODEL =====