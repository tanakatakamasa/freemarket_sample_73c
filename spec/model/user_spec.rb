require 'rails_helper'
describe User do
  describe '#create' do
    it "no nickname, no sign up" do
     user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name: "あああ", last_name_kana: "アアア", first_name: "いいい", first_name_kana: "イイイ", birthday: "2020-04-30")
     user.valid?
     expect(user.errors[:nickname]).to include("can't be blank")
    end
  end
  describe '#create' do
    it "no password, no sign up" do
      user = User.new(nickname: "ま", email: "kkk@gmail.com", password: "", password_confirmation: "00000000", last_name: "あああ" , last_name_kana: "アアア", first_name: "いいい", first_name_kana: "イイイ", birthday: "2020-04-30")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
     end
  end
  describe '#create' do
    it "no password-confirmation, no sign up" do
      user = User.new(nickname: "ま", email: "kkk@gmail.com", password: "00000000", password_confirmation: "", last_name: "あああ" , last_name_kana: "アアア", first_name: "いいい", first_name_kana: "イイイ", birthday: "2020-04-30")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("can't be blank")
     end
  end
  describe '#create' do
    it "no last_name, no sign up" do
      user = User.new(nickname: "ま", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name: "" , last_name_kana: "アアア", first_name: "いいい", first_name_kana: "イイイ", birthday: "2020-04-30")
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
     end
  end
  describe '#create' do
    it "no last_name_kana, no sign up" do
      user = User.new(nickname: "ま", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name: "あああ" , last_name_kana:"", first_name: "いいい", first_name_kana: "イイイ", birthday: "2020-04-30")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
     end
  end
  describe '#create' do
    it "no first_name, no sign up" do
      user = User.new(nickname: "ま", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name: "あああ" , last_name_kana:"アアア", first_name:"", first_name_kana:"イイイ", birthday: "2020-04-30")
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
     end
  end
  describe '#create' do
    it "no first_name_kana, no sign up" do
      user = User.new(nickname: "ま", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name: "あああ" , last_name_kana:"アアア", first_name:"いいい", first_name_kana:"", birthday: "2020-04-30")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
     end
  end
  describe '#create' do
    it "no birth_day, no sign up" do
      user = User.new(nickname: "ま", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name: "あああ" , last_name_kana:"アアア", first_name:"いいい", first_name_kana:"イイイ", birthday: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
     end
  end
end