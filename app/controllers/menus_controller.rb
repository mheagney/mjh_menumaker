class MenusController < ApplicationController
  before_action :authenticate_user!
  before_action :set_menu, only: [:edit, :update, :show, :destroy]

  def index
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.user_id = current_user.id

    if @menu.valid?
      @menu.save
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @menu.update(menu_params)
      @menu.save
      redirect_to menus_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def set_menu
    @menu = current_user.menus.find(params[:id])
  end

  def menu_params
    params.require(:menu).permit(:title, :restaurant_id)
  end
end
