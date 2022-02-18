class Airline < ApplicationRecord
    has_many :reviews
    before_create :slugify
    def slugify
        self.slug = name.downcase.gsub(/[^a-z1-9]+/, '-').chomp('-')
    end
    def avg_score
        reviews.average(:score).round(2).to_f
    end
    
end
