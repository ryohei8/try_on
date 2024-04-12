class Tryonforclient
  # ActiveModelで利用できる機能を使うために
  include ActiveModel::Model

  # Storeモデルからデータを取得するメソッドを定義
  def stores
    Store.all
  end

  def items
    Item.all
  end


end
