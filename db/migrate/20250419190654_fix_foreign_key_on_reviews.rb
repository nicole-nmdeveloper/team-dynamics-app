class FixForeignKeyOnReviews < ActiveRecord::Migration[8.0]
  def change
    remove_foreign_key :reviews, :dinamicas
    add_foreign_key :reviews, :dinamicas, on_delete: :cascade
  end
end
