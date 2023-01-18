class AddPublishedToMenus < ActiveRecord::Migration[7.0]
  def change
    add_column :menus, :published, :boolean
  end
end
