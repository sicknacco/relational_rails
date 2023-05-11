class Shops::PiesController < ApplicationController
  def index
    @shop = Shop.find(params[:id])
    @pies = @shop.pies
  end

  def new
    @shop = Shop.find(params[:id])
  end

  def create
    @shop = Shop.find(params[:id])
    @pie = @shop.pies.new(pie_params)
    if @pie.save
      redirect_to "/shops/#{@shop.id}/pies"
    else
      redirect_to "/shops/#{@shop.id}/pies/new"
      flash[:alert] = "Error: You must complete all fields"
    end
  end

  private
  def pie_params
    params.permit(:id, :name, :category, :bake_time, :wholesale)
  end
end