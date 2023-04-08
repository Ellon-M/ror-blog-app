class Like < ApplicationRecord
  after_save :update_likes_counter

  belongs_to :user, foreign_key: :user_id
  belongs_to :post, foreign_key: :post_id

  def update_likes_counter
    post.update(likes_counter: Like.where(post_id:).count)
  end
end
