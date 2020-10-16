require 'rails_helper'

describe Profile do
  describe '#create' do
    it "全て正しい値ならば登録する" do
      profile = build(:profile)
      expect(profile).to be_valid
    end
    it "family_nameが無い場合は登録できない" do
      profile = build(:profile, family_name: nil)
      profile.valid?
      expect(profile.errors[:family_name]).to include("を入力してください")
    end
    it "first_nameが無い場合は登録できない" do
      profile = build(:profile, first_name: nil)
      profile.valid?
      expect(profile.errors[:first_name]).to include("を入力してください")
    end
    it "family_name_kanaが無い場合は登録できない" do
      profile = build(:profile, family_name_kana: nil)
      profile.valid?
      expect(profile.errors[:family_name_kana]).to include("を入力してください")
    end
    it "first_name_kanaが無い場合は登録できない" do
      profile = build(:profile, first_name_kana: nil)
      profile.valid?
      expect(profile.errors[:first_name_kana]).to include("を入力してください")
    end
    it "birthdayが無い場合は登録できない" do
      profile = build(:profile, birthday: nil)
      profile.valid?
      expect(profile.errors[:birthday]).to include("を入力してください")
    end
    it "family_name_kanaが不正な値の場合は登録できない" do
      profile = build(:profile, family_name_kana: "やまだ")
      profile.valid?
      expect(profile.errors[:family_name_kana]).to include("は不正な値です")
    end
    it "first_name_kanaが不正な値の場合は登録できない" do
      profile = build(:profile, first_name_kana: "taro")
      profile.valid?
      expect(profile.errors[:first_name_kana]).to include("は不正な値です")
    end
  end
end