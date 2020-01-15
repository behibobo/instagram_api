class Post < ApplicationRecord
  belongs_to :user
  has_many :post_likes

  def like_count
    post_likes.count
  end
end
