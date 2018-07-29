class Lecture < ActiveRecord::Base
    belongs_to :lecturer
    has_many :reviews
    has_many :lecture_categories
    
    
end
