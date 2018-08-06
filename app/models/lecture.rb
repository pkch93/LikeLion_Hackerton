class Lecture < ActiveRecord::Base
    belongs_to :lecturer
    has_many :reviews
    has_many :lecture_categories
    
    mount_uploader :lec_poster, ImageUploader
end
