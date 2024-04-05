class ItemsController < ApplicationController
  def index
    @item = Item.new
    @items = Item.order("created_at DESC")
  end
  
  def create
    item = Item.create(item_params)
    render json:{ item: item }, status: :created
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :size_id, :price, :number_of_inventory)
  end
end
