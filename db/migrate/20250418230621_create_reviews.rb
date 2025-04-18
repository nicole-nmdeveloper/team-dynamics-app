class CreateReviews < ActiveRecord::Migration[8.0]
  def change
    create_table :reviews do |t|
      t.string :comentario
      t.integer :nota
      t.date :data_criacao

      t.timestamps
    end
  end
end
