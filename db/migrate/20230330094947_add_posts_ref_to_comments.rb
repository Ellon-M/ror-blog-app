class AddPostsRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :post, on_delete: :cascade, null: false, foreign_key: true
  end
end
