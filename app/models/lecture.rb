class Lecture < ActiveRecord::Base
    belongs_to :Lecturer
    has_many :Review
end
