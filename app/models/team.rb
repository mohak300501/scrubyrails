class Team < ApplicationRecord
  has_one_attached :image
  
  validates :name, presence: true
  validates :year, presence: true
  validates :branch, presence: true
  validates :mail, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end