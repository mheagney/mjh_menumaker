class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :menus
  has_one :active_menu, -> { where(menus: { published: true }) }, class_name: "Menu"
  has_many :business_hours
  has_many :likes, as: :likeable
  accepts_nested_attributes_for :business_hours, allow_destroy: true
end
