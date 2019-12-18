require 'rails_helper'

RSpec.describe Card ,type: :model do

  before do
    @user = FactoryBot.create(:user)
  end

  describe '#create' do
    it "user_idとcustomer_idとcard_idが存在すれば登録できる" do
      user = @user
      card = build(:card)
      expect(card).to be_valid
    end

    it "customer_idが空だと登録できない" do
      card = build(:card, customer_id: nil)
      card.valid?
      expect(card.errors[:customer_id])
    end

    it "card_idが空だと登録できない" do
      card = build(:card, card_id: nil)
      card.valid?
      expect(card.errors[:card_id])
    end
  end
end
