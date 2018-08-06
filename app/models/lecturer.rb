class Lecturer < ActiveRecord::Base
    has_many :lectures
    has_many :lecturer_categories
    
    mount_uploader :lec_img, ImageUploader
    validates :lec_id, :pw, :name, presence: true
    
    validates :lec_id,
        presence: true, # 값이 비었는지 확인
        uniqueness: true,
        length: {minimum: 6, maximum: 20, 
        too_short: "아이디는 6~20글자를 가집니다. 수정해주세요!",
        too_long: "아이디는 6~20글자를 가집니다. 수정해주세요!" }
    
    validates :pw,
        presence: true,
        confirmation: true,
        length: {minimum: 8, maximum: 20}
        
    validates :sex,
        inclusion: {in: ["남","여"]}
    
    validates :career,
        numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 50}
        
    validates :shortintro,
        length: {maximum: 15}
end
