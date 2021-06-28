class Post < ActiveRecord::Base 
    validates :title, presence: true, length: { minimum: 5, maximum: 40}
    validates :description, presence: true, length: { minimum: 20, maximum: 500}
end