class Lecture < ActiveRecord::Base
    belongs_to :lecturer
    has_many :reviews, dependent: :delete_all
    has_many :lecture_categories, dependent: :delete_all
    
    mount_uploader :lec_poster, ImageUploader
    
    validates :title, :intro, :time, :subject, presence: true
end
