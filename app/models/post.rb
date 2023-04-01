class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user, foreign_key: :author_id
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  # Title must not be blank.
  validates :title, presence: true, length: { maximum: 250 }

  # CommentsCounter must be an integer greater than or equal to zero.
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # LikesCounter must be an integer greater than or equal to zero.
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_post_counter

  def update_post_counter
    author.increment!(:posts_counter)
  end

  def most_recent_comments
    comments.last(5)
  end
end
