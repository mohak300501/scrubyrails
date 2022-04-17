class User < ApplicationRecord
    scope :filter_by_country, -> (country) { where('country like ?', '%country%') }
    scope :filter_by_state, -> (state) { where('state like ?', '%state%') }
    scope :filter_by_pin, -> (pin) { where('pin like ?', '%pin%') }
    scope :filter_by_gender, -> (gender) { where('gender like ?', '%gender%') }
    scope :filter_by_age, -> (age) { where('age like ?', '%age%') }
    scope :filter_by_sanslevel, -> (sanslevel) { where('sanslevel like ?', '%sanslevel%') }
    scope :filter_by_acadqual, -> (acadqual) { where('acadqual like ?', '%acadqual%') }
end
