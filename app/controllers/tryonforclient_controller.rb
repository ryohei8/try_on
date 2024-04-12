class TryonforclientController < ApplicationController
  def index
    tryonforclient = Tryonforclient.new
    @stores = tryonforclient.stores
    @items = tryonforclient.items
    @q = Item.ransack(params[:q])
    @markers = search(params[:q])
  end

  def search(query)
    @q = Item.ransack(query)
    @search_result = @q.result.includes(:store)
    stores_with_inventory = @search_result.select{ |item| item.number_of_inventory > 3 }.map(&:store)

    @markers = stores_with_inventory.map do |store|
      {
        lat: store.latitude,
        lng: store.longitude,
      }
    end
  end
end
