class ShopsController < ApplicationController
  def index
    @shops = Shop.shops_by_timestamp
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def new

  end

  def create
    shop = Shop.new(shop_params)
    if shop.save
      redirect_to '/shops'
    else
      redirect_to '/shops/new'
      flash[:alert] = "Error: You must complete all fields"
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  private
  def shop_params
    params.permit(:id, :name, :city, :employee_count, :order_ahead)
  end
end