class PiesController < ApplicationController
  def index
    @pies = Pie.all
  end

  def show
    @pie = Pie.find(params[:id])
  end
  
  def edit
    @pie = Pie.find(params[:id])
  end

  def update
    @pie = Pie.find(params[:id])
    @pie.update(pie_params)
    redirect_to "/pies/#{@pie.id}"
  end

  private
  def pie_params
    params.permit(:id, :name, :category, :bake_time, :wholesale)
  end
end