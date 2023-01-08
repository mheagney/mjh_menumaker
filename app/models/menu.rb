class Menu < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_many :sections
end
