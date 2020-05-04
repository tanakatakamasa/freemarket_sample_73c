# require 'rails_helper'

# describe User do
#   describe '#create' do

#     it "is valid with nickname,email,password, password_confirmation, last_name, last_name_kana, first_name, first_name_kana" do
#       user = build(:user, nickname: "abe")
#       expect(user).to be_valid
#     end

#     it "is invalid without nickname" do
#       user = build(:user, nickname: nil)
#       user.valid?
#       expect(user.errors[:nickname]).to include("入力してください")
#     end

#     it "is invalid without email" do
#       user = build(:user, email: nil)
#       user.valid?
#       expect(user.errors[:email]).to include("入力してください")
#     end

#     it "is invalid if email is duplicated" do
#       user = create(:user)
#       another_user = build(:user, email: user.email)
#       another_user.valid?
#       expect(another_user.errors[:email]).to include("を入力してください")
#     end

#     it "is invalid without password" do
#       user = build(:user, password: nil)
#       user.valid?
#       expect(user.errors[:password]).to include("を入力してください")
#     end

#     it "is invalid that password does not match password_confirmation" do
#       user = build(:user, password_confirmation: "")
#       user.valid?
#       expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
#     end

#     it "is valid that password is 7 or more characters" do
#       user = build(:user, password: "0000000", password_confirmation: "0000000")
#       user.valid?
#       expect(user).to be_valid
#     end


#     it "is invalid that password is 6 or less characters" do
#       user = build(:user, password: "000000", password_confirmation: "000000")
#       user.valid?
#       expect(user.errors[:password]).to include("は7文字以上で入力してください")
#     end

#     it "is invalid without birthday" do
#       user = build(:user, password: "000000", password_confirmation: "000000")
#       user.valid?
#       expect(user.errors[:birthday]).to include("を入力してください")
#     end
    
#   end
# end