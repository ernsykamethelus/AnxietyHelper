class Blogs < ApplicationController
    belongs_to :user 
    # has_many :comments
    validates :name, presence: true, uniqueness: true
end