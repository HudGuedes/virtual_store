class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.decimal :price, null: false, precision: 10, scale: 2
      t.decimal :price_discount, precision: 10, scale: 2
      t.boolean :home, default: false
      t.belongs_to :category, foreign_key: true, null:false
    end
  end
end
