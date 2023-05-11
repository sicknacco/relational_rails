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
end