class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.decimal :price, precision: 10, scale: 2, default: 0.0
      t.string :image
      t.integer :position
      t.belongs_to :section, null: false, foreign_key: true

      t.timestamps
    end
  end
end
