class ChangeForeignKeyOfLike < ActiveRecord::Migration[7.0]
  def change
    def change
      rename_column :likes, :user_id, :author_id
    end
  end
end
