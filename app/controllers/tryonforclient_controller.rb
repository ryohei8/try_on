class TryonforclientController < ApplicationController
  before_action :basic_auth
  before_action :set_search_object

  def index
  end

  def search
  # カテゴリーが選択されていない場合、検索結果を表示しない
  if params[:q][:category_eq].blank?
    return render nil
  end

  # 商品名が指定されていない場合、検索結果を表示しない
  if params[:q][:item_name_cont].blank?
    return render nil
  end    
    
    search_result = @q.result.includes(:store)

    stores_with_inventory = search_result.select{ |item| item.number_of_inventory > 3 }.map(&:store)
    markers = stores_with_inventory.map do |store|
      {
        lat: store.latitude,
        lng: store.longitude,
        store_name: store.store_name,
        address: store.address,
        description: store.description,
        opening_hours: store.opening_hours
      }
    end
    render json:{ markers: markers }
  end

  private

  def set_search_object
    @q = Item.ransack(params[:q], auth_object: :consumer)
  end
end