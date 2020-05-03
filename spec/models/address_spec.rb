# require 'rails_helper'
# describe Address do
#   describe '#create' do
#     it "is invalid without a last_name" do
#       user = Address.new(last_name: "" , last_name_kana:"アアア", first_name:"いいい", first_name_kana:"イイイ", postal_code:"000-0000", prefecture_id:"1", city:"渋谷区", street:"道玄坂")
#       user.valid?
#       expect(user.errors[:last_name]).to include("を入力してください")
#      end
#   end
#   describe '#create' do
#     it "is invalid without a last_name_kana" do
#       user = Address.new(last_name: "あああ" , last_name_kana:"", first_name:"いいい", first_name_kana:"イイイ", postal_code:"000-0000", prefecture_id:"1", city:"渋谷区", street:"道玄坂")
#       user.valid?
#       expect(user.errors[:last_name_kana]).to include("を入力してください")
#      end
#   end
#   describe '#create' do
#     it "is invalid without a first_name" do
#       user = Address.new(last_name: "あああ" , last_name_kana:"アアア", first_name:"", first_name_kana:"イイイ", postal_code:"000-0000", prefecture_id:"1", city:"渋谷区", street:"道玄坂")
#       user.valid?
#       expect(user.errors[:first_name]).to include("を入力してください")
#      end
#   end
#   describe '#create' do
#     it "is invalid without a first_name_kana" do
#       user = Address.new(last_name: "あああ" , last_name_kana:"アアア", first_name:"いいい", first_name_kana:"", postal_code:"000-0000", prefecture_id:"1", city:"渋谷区", street:"道玄坂")
#       user.valid?
#       expect(user.errors[:first_name_kana]).to include("を入力してください")
#      end
#   end
#   describe '#create' do
#     it "is invalid without a postal_code" do
#       user = Address.new(last_name: "あああ" , last_name_kana:"アアア", first_name:"いいい", first_name_kana:"イイイ", postal_code:"", prefecture_id:"1", city:"渋谷区", street:"道玄坂")
#       user.valid?
#       expect(user.errors[:postal_code]).to include("を入力してください")
#      end
#   end
#   describe '#create' do
#     it "is invalid without a prefecture_id" do
#       user = Address.new(last_name: "あああ" , last_name_kana:"アアア", first_name:"いいい", first_name_kana:"イイイ", postal_code:"000-0000", prefecture_id:"", city:"渋谷区", street:"道玄坂")
#       user.valid?
#       expect(user.errors[:prefecture_id]).to include("を入力してください")
#      end
#   end
#   describe '#create' do
#     it "is invalid without a city" do
#       user = Address.new(last_name: "あああ" , last_name_kana:"アアア", first_name:"いいい", first_name_kana:"イイイ", postal_code:"000-0000", prefecture_id:"1", city:"", street:"道玄坂")
#       user.valid?
#       expect(user.errors[:city]).to include("を入力してください")
#      end
#   end
#   describe '#create' do
#     it "is invalid without a street" do
#       user = Address.new(last_name: "あああ" , last_name_kana:"アアア", first_name:"いいい", first_name_kana:"イイイ", postal_code:"000-0000", prefecture_id:"1", city:"渋谷区", street:"")
#       user.valid?
#       expect(user.errors[:street]).to include("を入力してください")
#      end
#   end
# end
