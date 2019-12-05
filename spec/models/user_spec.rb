require 'rails_helper'

describe User do
  describe '#create' do
    it "emailとpasswordが存在すれば登録できる" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "emailが空だと登録できない" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "passwordが空だと登録できない" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "passwordが7文字以上であれば登録できる" do
      user = build(:user, password: "0000000")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが6文字以下だと登録できない" do
      user = build(:user, password: "000000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end
  end
end