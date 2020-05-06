require 'rails_helper'

describe Item do
  describe '#create' do

    it "is valid with a name, price, discription, condition_id, burden_id, prefecture_id, duration_id, seller_id, category_id" do
      item = FactoryBot.build(:item)
      expect(item).to be_valid
    end

    it "is invalid without name" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end



    it "is invalid without price" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "is invalid without discription" do
      item = build(:item, discription: "")
      item.valid?
      expect(item.errors[:discription]).to include("を入力してください")
    end

    it "is invalid without condition_id" do
      item = build(:item, condition_id: "")
      item.valid?
      expect(item.errors[:condition_id]).to include("を入力してください")
    end

    it "is invalid without burden_id" do
      item = build(:item, burden_id: "")
      item.valid?
      expect(item.errors[:burden_id]).to include("を入力してください")
    end

    it "is invalid without prefecture_id" do
      item = build(:item, prefecture_id: "")
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end

    it "is invalid without duration_id" do
      item = build(:item, duration_id: "")
      item.valid?
      expect(item.errors[:duration_id]).to include("を入力してください")
    end


    it "is invalid without category_id" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end

  end
end
