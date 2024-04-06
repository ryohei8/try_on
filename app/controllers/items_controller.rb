class ItemsController < ApplicationController
  def index
    @item = Item.new
    @items = Item.order("created_at DESC")
  end
  
  def create
    item = Item.create(item_params)
    size = Size.find(item.size_id)
    render json:{ item: item, size: size}, status: :created
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :size_id, :price, :number_of_inventory)
  end
end
