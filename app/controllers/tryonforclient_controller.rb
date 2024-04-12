class TryonforclientController < ApplicationController
  def index
    tryonforclient = Tryonforclient.new
    @stores = tryonforclient.stores
    @items = tryonforclient.items
    @q = Item.ransack(params[:q])
    @markers = search
  end

  def search
    @q = Item.ransack(params[:q])
    @search_result = @q.result.includes(:store)


    stores_with_inventory = @search_result.select{ |item| item.number_of_inventory > 3 }.map(&:store)

    @markers = stores_with_inventory.map do |store|
      {
        lat: store.latitude,
        lng: store.longitude
      }
    end
  end
    # 検索に入力されたitem_nameを取得
    # # number_of_inventoryが3より上の場合、そのitemに紐づくstoreを検索結果として返す
    # @stores_with_inventory = @items.map { |item| item.store_id }.flatten.select { |store| store.item.number_of_inventory > 3 }

    # respond_to do |format|
    #   format.json { render json: @stores_with_inventory.as_json(only: [:latitude, :longitude]) }
    # end
  end
