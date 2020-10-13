class Blogger < ApplicationRecord
    validates_uniqueness_of :name
    validates :age, :inclusion => { in: (1..) }
    validates :bio, :length => { minimum: 31 }

    has_many :posts
    has_many :destinations, through: :posts

    include Featurable

    def total_likes
        self.posts.sum(&:likes)
    end

    def top_5_destinations
        self.destinations.uniq.max_by(5) { |d| d.posts.size }
    end

end
