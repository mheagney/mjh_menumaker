class SectionPolicy
  attr_reader :user, :section

  def initialize(user, section)
    @user = user
    @section = section
  end

  def show?
    @user.present? && user.menus.include?(section.menu)
  end

  def new?
    @user.present?
  end

  def create?
    @user.present?
  end

  def move?
    @user.present? && user.menus.include?(section.menu)
  end

  def confirm?
    @user.present? && user.menus.include?(section.menu)
  end

  def update?
    @user.present? && user.menus.include?(section.menu)
  end

  def edit?
    @user.present? && user.menus.include?(section.menu)
  end

  def destroy?
    @user.present? && user.menus.include?(section.menu)
  end
end