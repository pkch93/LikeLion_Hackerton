class Lecturer < ActiveRecord::Base
    self.primary_key = 'lec_id'
    has_many :Lecture
end
