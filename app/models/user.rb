class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :likes
  has_many :restaurants
  has_many :menus
  has_many :business_hours, :through => :restaurants

  def like!(likeable)
    likes << Like.new(likeable_id: likeable.id, likeable_type: likeable.class)
  end

  def unlike!(likeable)
    likes.where(likeable_id: likeable.id, likeable_type: likeable.class.to_s).delete_all
  end

  def likes?(likeable)
    likes.find_by(likeable_id: likeable.id, likeable_type: likeable.class.to_s) ? true : false
  end
end
