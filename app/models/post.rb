class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user, foreign_key: :author_id, counter_cache: :posts_counter
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all

  # Title must not be blank.
  validates :title, presence: true, length: { maximum: 250 }

  # CommentsCounter must be an integer greater than or equal to zero.
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # LikesCounter must be an integer greater than or equal to zero.
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_post_counter
    author.increment!(:posts_counter)
    if author.posts_counter.nil?
      author.update(posts_counter: 1)
    else
      author.posts_counter += 1
      author.update(posts_counter: author.posts_counter)
    end
  end

  def most_recent_comments
    comments.last(5)
  end
end
