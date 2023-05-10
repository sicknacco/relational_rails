class ShopsController < ApplicationController
  def index
    @shops = Shop.shops_by_timestamp
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def new
    
  end
end