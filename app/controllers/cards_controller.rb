class CardsController < ApplicationController
  require "payjp"
  before_action :set_card

  def new
    card = Card.where(user_id: current_user.id).first
    redirect_to action: "index" if card.present?
  end

  def create #直前のnewアクションでpayjpからトークンとして返ってきたpayjp-tokenを、customer_idとcard_idとしてデータベースへ保管
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]

    if params['payjp-token'].blank?
      redirect_to action: "new"
    else #customer_idとcard_idを自分たちのデータベースの型に合わせて保管するためにcustomerという変数へ代入
      customer = Payjp::Customer.create(
        card: params['payjp-token'],
      )
      #ここでpayjpのトークンをデータベースの型に合わせて保存
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "index"
      else
        redirect_to action: "create"
      end
    end
  end


  def index
    if @card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)
      @card_brand = @card_information.brand
      case @card_brand
      when "Visa"
        @card_src = "visa.png"
      when "MasterCard"
        @card_src = "mastercard.png"
      when "JCB"
        @card_src = "jcb.png"
      when "American Express"
        @card_src = "americanexpress.png"
      when "Diners Club"
        @card_src = "dinersclub.png"
      when "Discover"
        @card_src = "discover.png"
      end
    end
  end

  def destroy
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    if @card.destroy
      redirect_to action: "index", notice: "削除しました"
    else
      redirect_to action: "index", alert: "削除できませんでした"
    end
  end

  private
  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
end