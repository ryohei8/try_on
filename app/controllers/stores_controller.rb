class StoresController < ApplicationController
  include Pagy::Frontend
  before_action :authenticate_user!, except: [:index] 

  def index
    @pagy, @stores = pagy(Store.all.order("created_at DESC"), items: 20)

  end
  
  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to stores_path
    else
      render :new, status: :unprocessable_entity
    end
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


  def destroy
    store = Store.find(params[:id])
    store.destroy
    redirect_to stores_path
  end

  private
  def store_params
    params.require(:store).permit(:store_name, :description, :address, :latitude, :longitude, :opening_hours)
  end
end
