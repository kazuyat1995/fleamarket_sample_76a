require 'rails_helper'

describe User do
  describe '#create' do
    it "nickname, email, passwordがあれば登録する" do
      user = build(:user)
      expect(user).to be_valid
    end
    it "nicknameがない場合は登録できない" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end
    it "emailがない場合は登録できない" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    it "emailが不正な値の場合は登録できない" do
      user = build(:user, email: "mail.com")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end
    it "同emailが既に登録されている場合" do
      user1 = create(:user)
      expect(build(:user, email: user1.email)).to_not be_valid
    end
    it "passwordが空の場合" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
    it "passwordが7文字よりも短い場合" do
      user = build(:user, password: "aaa111")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end
  end
end