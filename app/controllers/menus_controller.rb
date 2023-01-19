class MenusController < ApplicationController
  before_action :authenticate_user!
  before_action :set_menu, only: [:edit, :update, :show, :destroy, :confirm]

  def index
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.user_id = current_user.id

    if @menu.save
      set_published
      flash[:notice] = "Menu Created, add some sections!"
      redirect_to edit_menu_path(@menu)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    render layout: "menu"
  end

  def edit
  end

  def update
    if @menu.update(menu_params)
      set_published
      flash[:notice] = "Menu Updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @menu.destroy
      flash[:notice] = "Menu Removed."
    end
  end

  def confirm
  end

  private

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def set_published
    if @menu.published
      @menu.restaurant.menus.all_except(@menu).update_all(published: false)
    end
  end

  def menu_params
    params.require(:menu).permit(:title, :description, :restaurant_id, :published)
  end
end
