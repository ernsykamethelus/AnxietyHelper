class User < ActiveRecord::Base 
    has_many :posts
    has_secure_password
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 4, maximum: 20 }
    validates :email, presence: true, length: {maximum: 100 }, uniqueness: { case_sensitive: false }
    before_save { self.email = email.downcase }
end