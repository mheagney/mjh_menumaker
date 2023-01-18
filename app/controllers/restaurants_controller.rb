class RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_restaurant, only: [:edit, :update, :show, :destroy]
  before_action :set_hours, only: [:new, :edit]

  def index
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = current_user.id
    if @restaurant.valid?
      @restaurant.save
      redirect_to restaurants_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @restaurant = Restaurant.new
    Date::DAYS_INTO_WEEK.each_value do |i|
      @restaurant.business_hours.build
    end
  end

  def update
    if @restaurant.update(restaurant_params)
      @restaurant.save
      redirect_to restaurants_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
  end

  def destroy
  end

  private

  def set_restaurant
    @restaurant = current_user.restaurants.find(params[:id])
  end

  def set_hours
    @hours = [["12:00 AM", "00:00:00"],
              ["12:30 AM", "00:30:00"],
              ["1:00 AM", "01:00:00"],
              ["1:30 AM", "01:30:00"],
              ["2:00 AM", "02:00:00"],
              ["2:30 AM", "02:30:00"],
              ["3:00 AM", "03:00:00"],
              ["3:30 AM", "03:30:00"],
              ["4:00 AM", "04:00:00"],
              ["4:30 AM", "04:30:00"],
              ["5:00 AM", "05:00:00"],
              ["5:30 AM", "05:30:00"],
              ["6:00 AM", "06:00:00"],
              ["6:30 AM", "06:30:00"],
              ["7:00 AM", "07:00:00"],
              ["7:30 AM", "07:30:00"],
              ["8:00 AM", "08:00:00"],
              ["8:30 AM", "08:30:00"],
              ["9:00 AM", "09:00:00"],
              ["9:30 AM", "09:30:00"],
              ["10:00 AM", "10:00:00"],
              ["10:30 AM", "10:30:00"],
              ["11:00 AM", "11:00:00"],
              ["11:30 AM", "11:30:00"],
              ["12:00 PM", "12:00:00"],
              ["12:30 PM", "12:30:00"],
              ["1:00 PM", "13:00:00"],
              ["1:30 PM", "13:30:00"],
              ["2:00 PM", "14:00:00"],
              ["2:30 PM", "14:30:00"],
              ["3:00 PM", "15:00:00"],
              ["3:30 PM", "15:30:00"],
              ["4:00 PM", "16:00:00"],
              ["4:30 PM", "16:30:00"],
              ["5:00 PM", "17:00:00"],
              ["5:30 PM", "17:30:00"],
              ["6:00 PM", "18:00:00"],
              ["6:30 PM", "18:30:00"],
              ["7:00 PM", "19:00:00"],
              ["7:30 PM", "19:30:00"],
              ["8:00 PM", "20:00:00"],
              ["8:30 PM", "20:30:00"],
              ["9:00 PM", "21:00:00"],
              ["9:30 PM", "21:30:00"],
              ["10:00 PM", "22:00:00"],
              ["10:30 PM", "22:30:00"],
              ["11:00 PM", "23:00:00"],
              ["11:30 PM", "23:30:00"]]
  end

  def restaurant_params
    params.require(:restaurant).permit(
      :name, :address, :address2, :city, :state, :zipcode,
      :phone, :email, :web, :twitter, :instagram, :facebook,
      business_hours_attributes: [:day, :open_at, :close_at, :closed, :id],
    )
  end
end
