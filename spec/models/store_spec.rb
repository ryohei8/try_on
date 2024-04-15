require 'rails_helper'

RSpec.describe Store, type: :model do
  before do
    @store = FactoryBot.build(:store)
  end
  describe '店舗登録' do
    context '店舗を登録できる' do
      it 'description以外の全ての項目が存在すれば登録できる' do
        expect(@store).to be_valid
      end
    end
    context '店舗を登録できない' do
      it 'store_nameが空では登録できない' do
        @store.store_name = ''
        @store.valid?
        expect(@store.errors.full_messages).to include "店舗名を入力してください"
      end
      it 'addressが空では登録できない' do
        @store.address = ''
        @store.valid?
        expect(@store.errors.full_messages).to include "住所を入力してください"
      end
      it 'opening_hours空では登録できない' do
        @store.opening_hours = ''
        @store.valid?
        expect(@store.errors.full_messages).to include "営業時間を入力してください"
      end
      it 'latitude空では登録できない' do
        @store.latitude = ''
        @store.valid?
        expect(@store.errors.full_messages).to include "緯度を入力してください"
      end
      it 'longitude空では登録できない' do
        @store.longitude = ''
        @store.valid?
        expect(@store.errors.full_messages).to include "経度を入力してください"
      end
      
    end
  end
end