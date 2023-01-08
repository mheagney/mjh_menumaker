class Item < ApplicationRecord
  acts_as_list
  belongs_to :section
end
