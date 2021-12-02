require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @comment = FactoryBot.build(:comment, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe 'コメント投稿ができる場合' do
    context 'コメントができる場合' do
      it '全て記入されて入れば保存される' do
        expect(@comment).to be_valid
      end
    end

    context 'コメント投稿ができない場合' do
      it 'コメントが空だと登録できない' do
        @comment.text = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
      it 'userと紐づいてないと購入できない' do
        @comment.user_id = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")
      end
      it 'itemと紐づいてないと購入できない' do
        @comment.item_id = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Item must exist")
      end
    end
  end
end
