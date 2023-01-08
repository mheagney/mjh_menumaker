class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :menus
  has_many :business_hours

  accepts_nested_attributes_for :business_hours, allow_destroy: true
end
