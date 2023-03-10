class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :menus, dependent: :destroy
  has_one :active_menu, -> { where(menus: { published: true }) }, class_name: "Menu"
  has_many :business_hours, dependent: :destroy
  has_one_attached :image
  has_many :likes, as: :likeable, dependent: :destroy
  accepts_nested_attributes_for :business_hours, allow_destroy: true
  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true
end
