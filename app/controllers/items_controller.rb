class ItemsController < ApplicationController
  def index
    @item = Item.new
    @items = Item.all.order("created_at DESC")
  end
  
  def create
    item = Item.create(item_params)
    size = Size.find(item.size_id)
    render json:{ item: item, size: size}, status: :created
  end

  def edit
    @item = Item.find(params[:id])
    @items = Item.all.order("created_at DESC")
  end

  def update
    @item = Item.find(params[:id])
    @size = Size.find(@item.size_id)
    if @item.update(item_params)
      render json:{ item: @item, size: @size}, status: :ok
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :size_id, :price, :number_of_inventory)
  end
end
