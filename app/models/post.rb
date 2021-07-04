class Post < ActiveRecord::Base 
    belongs_to :user 
    validates :title, presence: true, length: { minimum: 5, maximum: 40}
    validates :description, presence: true, length: { minimum: 20, maximum: 500}
    validates :user_id, presence: true

    def not_a_duplicate
        # if there is already an ice cream with that flavor && brand, throw an error
        post = Post.find_by(title: title, description: description)
        if !!post && post != self
          errors.add(:title, 'has already been added')
        end
      end
end