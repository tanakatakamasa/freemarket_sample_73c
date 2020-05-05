require 'rails_helper'
describe item do
  describe '#create' do
    it "is valid with a name, price, discription, condition_id, burden_id, prefecture_id, duration_id, seller_id, buyer_id, category_id" do
      user = create(:user)
      categorie = create(:categorie)
      item = FactoryBot.build(:item, user_id: user[:id], categorie_id: categorie[:id])
      expect(items).to be_valid
    end
  end
end
