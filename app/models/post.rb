class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validates :summary, length: {maximum: 250}
    validate :title_is_clickbait, on: :create

    def title_is_clickbait
        if title == nil
            errors.add(:title, "is required")
        elsif title.include?("Won't Believe") == false && title.include?("Secret") == false && title.include?("Top") == false && title.include?("Guess") == false
            errors.add(:title, "Is not clickbait")
        end 
    end
end
