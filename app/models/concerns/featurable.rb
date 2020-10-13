module Featurable
    extend ActiveSupport::Concern

    def featured_post
        self.posts.max_by { |p| p.likes }
    end

end