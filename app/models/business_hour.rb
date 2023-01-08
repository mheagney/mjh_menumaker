class BusinessHour < ApplicationRecord
  belongs_to :restaurant
  delegate :user, :to => :restaurant, :allow_nil => true
end
