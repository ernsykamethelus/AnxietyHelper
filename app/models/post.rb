class Post < ActiveRecord::Base 
    belongs_to :user 
    validates :title, presence: true, length: { minimum: 5, maximum: 40}
    validates :description, presence: true, length: { minimum: 20, maximum: 500}
    validates :user_id, presence: true
end