class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.string :image
      t.integer :position
      t.belongs_to :section, null: false, foreign_key: true

      t.timestamps
    end
  end
end
