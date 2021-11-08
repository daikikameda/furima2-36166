require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    context "新規登録できない時" do
      it "nicknameが空だと登録できない" do
        user = FactoryBot.build(:user)
        user.nickname = ''
        user.valid?
        expect(user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        user = FactoryBot.build(:user)
        user.email = ''
        user.valid?
        expect(user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空だと登録できない" do
        user = FactoryBot.build(:user)
        user.password = ''
        user.valid?
        expect(user.errors.full_messages).to include("Password can't be blank")
      end
      it "Passwordとpassword_confilmationが一致しないと登録できない" do
        user = FactoryBot.build(:user)
        user.password_confirmation = ''
        user.valid?
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "first_nameが空だと登録できない" do
        user = FactoryBot.build(:user)
        user.first_name = ''
        user.valid?
        expect(user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_nameが空だと登録できない" do
        user = FactoryBot.build(:user)
        user.last_name = ''
        user.valid?
        expect(user.errors.full_messages).to include("Last name can't be blank")
      end
      it "kana_first_nameが空だと登録できない" do
        user = FactoryBot.build(:user)
        user.kana_first_name = ''
        user.valid?
        expect(user.errors.full_messages).to include("Kana first name can't be blank")
      end
      it "kana_last_nameが空だと登録できない" do
        user = FactoryBot.build(:user)
        user.kana_last_name = ''
        user.valid?
        expect(user.errors.full_messages).to include("Kana last name can't be blank")
      end
      it "birthdayが空だと登録できない" do
        user = FactoryBot.build(:user)
        user.birthday = ''
        user.valid?
        expect(user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "passwordが６文字以上じゃないと登録できない" do
        user = FactoryBot.build(:user)
        user.password = '1111a'
        user.valid?
        expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "重複したメールアドレスは登録できない" do
        user1 = FactoryBot.build(:user)
        user1.save
        another_user = FactoryBot.build(:user, email: user1.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "メールアドレスに@を含まない場合は登録できない" do
        user = FactoryBot.build(:user)
        user.email = "test.test"
        user.valid?
        expect(user.errors.full_messages). to include("Email is invalid")
      end
      it "英字のみのパスワードでは登録できない" do
        user = FactoryBot.build(:user)
        user.password = "eeeeeee"
        user.valid?
        expect(user.errors.full_messages). to include("Password is invalid")
      end
      it "数字のみのパスワードでは登録できない" do
        user = FactoryBot.build(:user)
        user.password = "1111111"
        user.valid?
        expect(user.errors.full_messages). to include("Password is invalid")
      end
      it "全角文字を含むパスワードでは登録できない" do
        user = FactoryBot.build(:user)
        user.password = "MMMMMMM1"
        user.valid?
        expect(user.errors.full_messages). to include("Password confirmation doesn't match Password")
      end
      it "姓（全角）に半角文字が含まれていると登録できない" do
        user = FactoryBot.build(:user)
        user.first_name = "aaa"
        user.valid?
        expect(user.errors.full_messages). to include("First name is invalid")
      end
      it "名（全角）に半角文字が含まれていると登録できない" do
        user = FactoryBot.build(:user)
        user.last_name = "aaa"
        user.valid?
        expect(user.errors.full_messages). to include("Last name is invalid")
      end
      it "姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
        user = FactoryBot.build(:user)
        user.kana_first_name = (/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d][ぁ-ん一-龥々ー]+\z/i)
        user.valid?
        expect(user.errors.full_messages). to include("Kana first name is invalid")
      end
      it "名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
        user = FactoryBot.build(:user)
        user.kana_last_name = (/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d][ぁ-ん一-龥々ー]+\z/i)
        user.valid?
        expect(user.errors.full_messages). to include("Kana last name is invalid")
      end
    end
    context '新規登録できるとき' do
      it "全ての項目が入力されていれば登録できる" do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
      end
    end
  end
end
