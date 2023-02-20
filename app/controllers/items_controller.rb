class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_menu, only: [:create, :new, :edit, :update, :destroy, :confirm]
  before_action :set_section, only: [:create, :new, :edit, :update, :destroy, :confirm]
  before_action :set_item, only: [:edit, :move, :update, :destroy, :confirm]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params.except(:remove_image))
    @item.section = @section

    if @item.save
      @item.insert_at(1)
      flash[:notice] = "Item Added."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if item_params[:remove_image].to_i == 1
      @item.image.purge_later
    end
    if @item.update(item_params.except(:remove_image))
      flash[:notice] = "Item Updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def move
    @item.insert_at(params[:position].to_i)
    respond_to do |format|
      flash[:notice] = "Item order was successfully updated."
      format.turbo_stream {
        render turbo_stream: [
          turbo_stream.update("toasts", partial: "shared/flash"),
        ]
      }
    end
  end

  def destroy
    if @item.destroy
      flash[:notice] = "Item Removed."
    end
  end

  def confirm
  end

  private

  def set_menu
    @menu = authorize Menu.find(params[:menu_id])
  end

  def set_section
    @section = Section.find(params[:section_id])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params[:item][:price] = params[:item][:price].delete("$")
    params.require(:item).permit(:title, :description, :price, :image, :remove_image)
  end
end
