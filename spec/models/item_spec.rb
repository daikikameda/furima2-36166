require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品投稿の保存' do
    context "商品保存ができる場合" do
      it "全て記入されて入れば保存される" do
        expect(@item).to be_valid
      end
    end

    context "商品が保存できない場合" do
      it "画像が空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が空だと保存できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "商品説明が空だと保存できない" do
        @item.item_explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item explanation can't be blank")
      end
      it "商品カテゴリーが選択されないと保存できない" do
        @item.item_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it "商品状態が選択されないと保存できない" do
        @item.item_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end
      it "配送料の負担が選択されないと保存できない" do
        @item.delivery_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it "配送地域が選択されないと保存できない" do
        @item.delivery_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area can't be blank")
      end
      it "配送日時が選択されないと保存できない" do
        @item.delivery_date_id= ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date can't be blank")
      end
      it "価格が空だと保存できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "userが紐づいてないと保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it "価格が300以下だと保存できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "価格が999999以下だと保存できない" do 
        @item.price ="100000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "半角数字でないと保存できない" do
        @item.price ="１１１１１"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end
