class PiesController < ApplicationController
  def index
    @pies = Pie.wholesale_pies
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
  
  def delete
    pie = Pie.find(params[:id])
    Pie.destroy(params[:id])
    redirect_to '/pies'
  end

  private
  def pie_params
    params.permit(:id, :name, :category, :bake_time, :wholesale)
  end
end