class UpdateForeignKeyInComments < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :comments, :users  # Remove the existing foreign key constraint
    rename_column :comments, :author_id, :user_id
    add_foreign_key :comments, :users, column: :user_id
  end
end