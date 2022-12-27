class CreateJoinTableUserLikeable < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :user_id, null: false
      t.string :likeable_type, null: false
      t.integer :likeable_id, null: false
      t.index [:likeable_type, :likeable_id], name: "index_likes_on_likeable"
      t.index [:user_id], name: "index_likes_on_user_id"
    end
  end
end
