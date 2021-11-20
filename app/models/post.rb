class Post < ApplicationRecord  
    validates :title, :description, :marktsegment, presence: true
has_many :comments
end