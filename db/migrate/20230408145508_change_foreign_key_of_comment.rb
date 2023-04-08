class ChangeForeignKeyOfComment < ActiveRecord::Migration[7.0]
  def change
    def change
      rename_column :comments, :user_id, :author_id
    end
  end
end
