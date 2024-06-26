class ItemsController < ApplicationController
  include Pagy::Frontend
  before_action :authenticate_user!, except: [:index] 

  def index
    @q = Item.ransack(params[:q], auth_object: :inventory)
    @pagy, @items = pagy(@q.result(distinct: true).order("created_at DESC"), items: 20)
  end

  def new
    store_id = current_user.store_id
    @item = Item.new(store_id: store_id)
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  
  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :color, :size_id, :price, :number_of_inventory, :category, :store_id)
  end
end
