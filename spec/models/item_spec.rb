require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '商品を登録できる' do
      it '全ての項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が登録できない' do
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品名を入力してください"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "価格を入力してください"
      end
      it 'sizeが空では登録できない' do
        @item.size = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "サイズを選択してください"
      end
      it 'number_of_inventoryが空では登録できない' do
        @item.number_of_inventory = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "在庫数を入力してください"
      end
      it 'storeが空では登録できない' do
        @item.store = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "取り扱い店舗を入力してください"
      end
    end
  end
end
