class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :name, null: false
      t.string :path, null: false
      t.belongs_to :product, foreign_key: true, null:false
    end
  end
end
