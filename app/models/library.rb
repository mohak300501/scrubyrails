class Library < ApplicationRecord
    has_one_attached :link
    
    validates :bookid, presence: true, uniqueness: true
    validates :name, presence: true
    validates :serialno, presence: true
    validates :author, presence: true
    validates :primary_genre, presence: true
    validates :content_language, presence: true
    validates :copies, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :present, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :almirah, presence: true
    validates :rack, presence: true
end