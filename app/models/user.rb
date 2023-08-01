class User < ApplicationRecord
    scope :filter_by_, lambda { |key, value| where("#{key} like '%#{value}%'") }
end
