class Shops::PiesController < ApplicationController
  def index
    @shop = Shop.find(params[:id])
    @pies = sort_pies_threshold

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
      flash[:notice] = "Error: You must complete all fields"
      render :new
    end
  end

  private
  def pie_params
    params.permit(:id, :name, :category, :bake_time, :wholesale)
  end

  def sort_pies_threshold
    if !params[:bake_time].nil?
      return @shop.bake_time_threshold(params[:bake_time])
    else
      return @shop.alpha_names(params['sort'])
    end
  end
end