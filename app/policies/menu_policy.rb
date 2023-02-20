class MenuPolicy
  attr_reader :user, :menu

  def initialize(user, menu)
    @user = user
    @menu = menu
  end

  def show?
    @menu.published || (@user.present? && @user.menus.include?(menu))
  end

  def new?
    @user.present?
  end

  def create?
    @user.present?
  end

  def update?
    @user.present? && user.menus.include?(menu)
  end

  def qr_code?
    @user.present? && user.menus.include?(menu)
  end

  def confirm?
    @user.present? && user.menus.include?(menu)
  end

  def edit?
    @user.present? && user.menus.include?(menu)
  end

  def destroy?
    @user.present? &&user.menus.include?(menu)
  end
end