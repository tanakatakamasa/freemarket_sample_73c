require 'rails_helper'
describe Card do
  describe '#create' do
    it "customer_idとcard_idがあれば保存できる" do
      card = build(:card)
      expect(card).to be_valid
    end

    it "customer_idが空だと保存できない" do
      card = build(:card, customer_id: "")
      card.valid?
      expect(card.errors[:customer_id]).to include("カード情報が正しくありません。")
    end

    it "card_idが空だと保存できない" do
      card = build(:card, card_id: "")
      card.valid?
      expect(card.errors[:card_id]).to include("カード情報が正しくありません。")
    end

  end
end