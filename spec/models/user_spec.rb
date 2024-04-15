require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザーが登録できる' do
      it '全ての項目の存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context 'ユーザーが登録できない' do
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "姓を入力してください"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "名を入力してください"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールを入力してください"
      end
      it 'すでに存在するemailは登録できない' do
        @user = FactoryBot.create(:user)
        same_email = FactoryBot.build(:user, email: @user.email)
        same_email.valid?
        expect(same_email.errors.full_messages).to include "Eメールはすでに存在します"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードを入力してください"
      end
      it 'passwordとpassword_confirmationが一致しないと登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードを確認とパスワードの入力が一致しません"
      end
      it 'storeが空では登録できない' do
        @user.store = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "所属店舗を入力してください"
      end
    end
  end
end
