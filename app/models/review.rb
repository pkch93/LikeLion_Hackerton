class Review < ActiveRecord::Base
    belongs_to :lecture
    
    validates :sex, :age, :background, :content,
        presence: true
end
