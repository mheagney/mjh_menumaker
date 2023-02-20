class RestaurantPolicy
  attr_reader :user, :restaurant

  def initialize(user, restaurant)
    @user = user
    @restaurant = restaurant
  end

  def show?
    @user.present? && @user.restaurants.include?(restaurant)
  end

  def update?
    @user.present? && @user.restaurants.include?(restaurant)
  end

  def confirm?
    @user.present? && @user.restaurants.include?(restaurant)
  end

  def edit?
    @user.present? && @user.restaurants.include?(restaurant)
  end

  def destroy?
    @user.present? && @user.restaurants.include?(restaurant)
  end
end