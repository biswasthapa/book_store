class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.float :unit_price
      t.references :author, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.references :publisher, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
