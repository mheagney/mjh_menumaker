class CreateBusinessHours < ActiveRecord::Migration[7.0]
  def change
    create_table :business_hours do |t|
      t.integer :day
      t.string :open_at
      t.string :close_at
      t.boolean :closed
      t.belongs_to :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
