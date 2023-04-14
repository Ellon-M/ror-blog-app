class Comment < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  belongs_to :post, foreign_key: :post_id, counter_cache: :comments_counter
  after_save :update_comments_counter
  def update_comments_counter
    if post.comments_counter.nil?
      post.update(comments_counter: 1)
    else
      post.comments_counter += 1
      post.update(comments_counter: post.comments_counter)
    end
  end
end
