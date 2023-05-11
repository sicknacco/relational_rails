class Shops::PiesController < ApplicationController
  def index
    @shop = Shop.find(params[:id])
    @pies = @shop.pies
  end

  def new
  end
end