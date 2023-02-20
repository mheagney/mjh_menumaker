class Item < ApplicationRecord
  acts_as_list
  belongs_to :section
  
  has_one_attached :image do |image|
    image.variant :thumbnail, resize_to_limit: [144, 144]
  end
  money_column :price, currency: "USD"
  validates :title, presence: true
end
