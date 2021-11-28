require 'rails_helper'

RSpec.describe BuyForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    item.image = fixture_file_upload('public/image/sample1.png')
    user_purchase = UserPurchase.create(user_id: user.id, item_id: item.id)
    @buy_form = FactoryBot.build(:buy_form, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入の保存' do
    context '商品購入ができる場合' do
      it '全て記入されて入れば保存される' do
        expect(@buy_form).to be_valid
      end
      it '建物が空でも保存できる' do
        @buy_form.building = ''
        expect(@buy_form).to be_valid
      end
    end

    context '商品購入ができない場合' do
      it '郵便番号が記載されていないと保存できない' do
        @buy_form.post_code = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Post code can't be blank")
      end
      it '都道府県が記載されていないと保存できない' do
        @buy_form.delivery_area_id = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Delivery area can't be blank")
      end
      it '市区町村が記載されていないと保存できない' do
        @buy_form.city = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が記載されていないと保存できない' do
        @buy_form.addressline = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Addressline can't be blank")
      end
      it '電話番号が記載されていないと保存できない' do
        @buy_form.phone_number = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると登録できない' do
        @buy_form.phone_number = '090-2222-2222'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenがないと登録できない' do
        @buy_form.token = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号がハイフンなしだと登録できない' do
        @buy_form.post_code = '1169999'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Post code is invalid")
      end
      it 'userと紐づいてないと購入できない' do
        @buy_form.user_id = nil
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("User can't be blank")
      end
      it 'itemと紐づいてないと購入できない' do
        @buy_form.item_id = nil
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Item can't be blank")
      end
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @buy_form.delivery_area_id = 0
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Delivery area can't be blank")
      end
      it '9桁以下では登録できないこと' do
        @buy_form.phone_number = '09001111'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
      end
      it '12桁以上では登録できないこと' do
        @buy_form.phone_number = '09001112121211'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it '半角数字以外が含まれている場合、登録できないこと' do
        @buy_form.phone_number = '０９０１２３４２２２２'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
