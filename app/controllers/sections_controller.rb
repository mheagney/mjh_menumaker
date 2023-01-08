class SectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_menu, only: [:create, :new, :edit, :update, :destroy, :confirm]
  before_action :set_section, only: [:move, :edit, :update, :destroy, :confirm]

  def new
    @section = Section.new(menu: @menu)
  end

  def create
    @section = Section.new(section_params)
    @section.menu = @menu

    if @section.save
      @section.insert_at(1)
      flash[:notice] = "Section Added."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @section.update(section_params)
      flash[:notice] = "Section Updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def move
    @section.insert_at(params[:position].to_i)
    respond_to do |format|
      flash[:notice] = "Section order was successfully updated."
      format.turbo_stream {
        render turbo_stream: [
          turbo_stream.update("toasts", partial: "shared/flash"),
        ]
      }
    end
  end

  def confirm
  end

  def destroy
    if @section.destroy
      flash[:notice] = "Section Removed."
    end
  end

  private

  def set_menu
    @menu = Menu.find(params[:menu_id])
  end

  def set_section
    @section = Section.find(params[:id])
  end

  def section_params
    params.require(:section).permit(:title, :description)
  end
end
