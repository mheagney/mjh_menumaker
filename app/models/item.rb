class Item < ApplicationRecord
  acts_as_list
  belongs_to :section
  has_many :likes, as: :likeable
  has_one_attached :image
  money_column :price, currency: "USD"
  validates :title, presence: true
end
