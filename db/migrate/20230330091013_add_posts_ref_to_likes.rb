class AddPostsRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :post, on_delete: :cascade,  null: false, foreign_key: true
  end
end
