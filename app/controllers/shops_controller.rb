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
      flash[:notice] = "Error: You must complete all fields"
      render :new
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    shop = Shop.find(params[:id])
    if shop.update(shop_params)
      redirect_to "/shops/#{shop.id}"
    else
      redirect_to "/shops/#{shop.id}/edit"
      flash[:notice] = "Error: You must complete all fields"
    end
  end

  private
  def shop_params
    params.permit(:id, :name, :city, :employee_count, :order_ahead)
  end
end