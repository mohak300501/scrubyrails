class Game < ApplicationRecord

    has_one_attached :image
    
    validates :name, presence: true
    validates :info, presence: true
    
end
