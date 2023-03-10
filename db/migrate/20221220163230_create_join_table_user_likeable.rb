class CreateJoinTableUserLikeable < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.references :likeable, polymorphic: true, null: false
    end
  end
end
