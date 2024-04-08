class StoresController < ApplicationController
  def index
    @stores = Store.all.order("created_at DESC")
  end
  
  def new
    @store = Store.new
  end

  def create
    @store = Store.create(store_params)
    redirect_to stores_path
  end
  
  def edit
    @store= Store.find(params[:id])
  end

  def update
    @store = Store.find(params[:id])
    if @store.update(store_params)
      redirect_to stores_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def store_params
    params.require(:store).permit(:store_name, :description, :address, :latitude, :longitude, :opening_hours)
  end
end
