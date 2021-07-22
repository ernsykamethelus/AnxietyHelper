class User < ActiveRecord::Base 
    has_many :posts
    # has_many :commented_posts, through: :comments. source: :post
    has_secure_password
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 4, maximum: 20 }
    validates :email, presence: true, length: {maximum: 100 }, uniqueness: { case_sensitive: false }
    before_save { self.email = email.downcase }

    def self.create_by_google_omniauth(auth)
        self.find_or_create_by(username: auth[:info][:email]) do |u|
          u.password = SecureRandom.hex
        end
      end
    end