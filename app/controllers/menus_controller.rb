class MenusController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :verify_restaurants, except: [:show]
  before_action :set_menu, only: [:edit, :update, :show, :destroy, :confirm, :qr_code]

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
    else
      flash[:notice] = "Unable to Remove Menu."
    end
  end

  def confirm
  end

  def qr_code
    send_data RQRCode::QRCode.new(menu_url(@menu)).as_png(size: 300), type: "image/png", disposition: "attachment"
  end

  private

  def verify_restaurants
    if current_user.restaurants.empty?
      redirect_to new_restaurant_path, flash: {notice: "You must create your restaurant first!"}
    end
  end

  def set_menu
    @menu = authorize Menu.find(params[:id])

    if @menu.nil?
      redirect_to root_path, flash: {notice: "Menu not found"}
    end
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
