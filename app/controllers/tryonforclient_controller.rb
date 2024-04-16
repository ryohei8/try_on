class TryonforclientController < ApplicationController
  before_action :basic_auth
  before_action :set_search_object

  def index
  end

  def search
    return render json: { error: "商品名が指定されていません。" }, status: 400 if params[:q][:item_name_cont].blank?
    search_result = @q.result.includes(:store)
    stores_with_inventory = search_result.select{ |item| item.number_of_inventory > 3 }.map(&:store)

    markers = stores_with_inventory.map do |store|
      {
        lat: store.latitude,
        lng: store.longitude,
      }
    end
    render json:{ markers: markers }
  end

  private

  def set_search_object
    @q = Item.ransack(params[:q])
  end
end