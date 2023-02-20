class Menu < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_many :sections, dependent: :destroy
  scope :all_except, ->(menu) { where.not(id: menu) }
  validates :title, presence: true
end
