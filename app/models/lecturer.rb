class Lecturer < ActiveRecord::Base
    self.primary_key = 'lec_id'
    has_many :lectures
    has_many :lecturer_categories
    accepts_nested_attributes_for :lecturer_categories
end
