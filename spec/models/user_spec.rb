require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "ttt@test.com", password: "111111a", password_confirmation: "111111a", first_name: "山田", last_name: "太郎", kana_first_name: "ヤマダ", kana_last_name: "タロウ", birthday: "1992-04-03")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
      user = User.new(nickname: "furima", email: "", password: "111111a", password_confirmation: "111111a", first_name: "山田", last_name: "太郎", kana_first_name: "ヤマダ", kana_last_name: "タロウ", birthday: "1992-04-03")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空だと登録できない" do
      user = User.new(nickname: "furima", email: "ttt@test.com", password: "", password_confirmation: "111111a", first_name: "山田", last_name: "太郎", kana_first_name: "ヤマダ", kana_last_name: "タロウ", birthday: "1992-04-03")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "Passwordとpassword_confilmationが一致しないと登録できない" do
      user = User.new(nickname: "furima", email: "ttt@test.com", password: "111111a", password_confirmation: "111aaa", first_name: "山田", last_name: "太郎", kana_first_name: "ヤマダ", kana_last_name: "タロウ", birthday: "1992-04-03")
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "first_nameが空だと登録できない" do
      user = User.new(nickname: "furima", email: "ttt@test.com", password: "111111a", password_confirmation: "111111a", first_name: "", last_name: "太郎", kana_first_name: "ヤマダ", kana_last_name: "タロウ", birthday: "1992-04-03")
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it "last_nameが空だと登録できない" do
      user = User.new(nickname: "furima", email: "ttt@test.com", password: "111111a", password_confirmation: "111111a", first_name: "山田", last_name: "", kana_first_name: "ヤマダ", kana_last_name: "タロウ", birthday: "1992-04-03")
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it "kana_first_nameが空だと登録できない" do
      user = User.new(nickname: "furima", email: "ttt@test.com", password: "111111a", password_confirmation: "111111a", first_name: "山田", last_name: "太郎", kana_first_name: "", kana_last_name: "タロウ", birthday: "1992-04-03")
      user.valid?
      expect(user.errors.full_messages).to include("Kana first name can't be blank")
    end
    it "kana_last_nameが空だと登録できない" do
      user = User.new(nickname: "furima", email: "ttt@test.com", password: "111111a", password_confirmation: "111111a", first_name: "山田", last_name: "太郎", kana_first_name: "ヤマダ", kana_last_name: "", birthday: "1992-04-03")
      user.valid?
      expect(user.errors.full_messages).to include("Kana last name can't be blank")
    end
    it "birthdayが空だと登録できない" do
      user = User.new(nickname: "furima", email: "ttt@test.com", password: "111111a", password_confirmation: "111111a", first_name: "山田", last_name: "太郎", kana_first_name: "ヤマダ", kana_last_name: "タロウ", birthday: "")
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
    it "passwordが６文字以上じゃないと登録できない" do
      user = User.new(nickname: "furima", email: "ttt@test.com", password: "11111", password_confirmation: "11111", first_name: "山田", last_name: "太郎", kana_first_name: "ヤマダ", kana_last_name: "タロウ", birthday: "1992-04-03")
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end
end
