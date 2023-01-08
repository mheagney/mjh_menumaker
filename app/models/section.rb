class Section < ApplicationRecord
  include Turbo::Streams::ActionHelper
  include Turbo::Streams::StreamName
  acts_as_list
  belongs_to :menu
  has_many :items
end
