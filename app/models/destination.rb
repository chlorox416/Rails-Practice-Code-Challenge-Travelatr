class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    include Featurable

    def bloggers_average_age
        uniq_bloggers = self.bloggers.uniq
        uniq_bloggers.sum(&:age) / uniq_bloggers.size
    end

    def most_recent_5_post
        self.posts.max_by(5) { |p| p.updated_at }
    end

    
end
