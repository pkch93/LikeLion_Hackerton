class Review < ActiveRecord::Base
    belongs_to :lecture
    
    validates :sex, :age, :background, :content,
        presence: true
    
    validates :content,
        length: {minimum: 10}
end
