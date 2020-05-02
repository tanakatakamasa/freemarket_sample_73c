class CardsController < ApplicationController
  require "payjp"
  before_action :set_card

  def new # カードの登録画面。送信ボタンを押すとcreateアクションへ。
    card = Card.where(user_id: current_user.id).first
    redirect_to action: "index" if card.present?
  end

  def create #PayjpとCardのデータベースを作成
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]

    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      # トークンが正常に発行されていたら、顧客情報をPAY.JPに登録します。
      customer = Payjp::Customer.create(
        card: params['payjp-token'], # 直前のnewアクションで発行され、送られてくるトークンをここで顧客に紐付けて永久保存します。
      )
      # ここでpayjpのトークンをデータベースの型に合わせて保存します
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "index"
      else
        redirect_to action: "create"
      end
    end
  end


  def index #CardのデータをPayjpに送って情報を取り出す
    if @card.present?
      # 登録している場合,PAY.JPからカード情報を取得する
      # PAY.JPの秘密鍵をセットする。
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
            # PAY.JPから顧客情報を取得する。
      customer = Payjp::Customer.retrieve(@card.customer_id)
            # PAY.JPの顧客情報から、デフォルトで使うクレジットカードの情報を取得する。
      @card_information = customer.cards.retrieve(@card.card_id)

      # クレジットカード会社を取得し、カード会社の画像をviewに表示させるため、ここで先にファイルを指定する。
      @card_brand = @card_information.brand      
      case @card_brand
      when "Visa"
        @card_src = "material/logo_cards/visa.png"
      when "JCB"
        @card_src = "material/logo_cards/visa.png"
      when "MasterCard"
        @card_src = "material/logo_cards/visa.png"
      when "American Express"
        @card_src = "material/logo_cards/visa.png"
      when "Diners Club"
        @card_src = "material/logo_cards/visa.png"
      when "Discover"
        @card_src = "material/logo_cards/visa.png"
      end
    end
  end

  def destroy #PayjpとCardのデータベースを削除
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    if @card.destroy #削除に成功した時にポップアップを表示します。
      redirect_to action: "index", notice: "削除しました"
    else #削除に失敗した時にアラートを表示します。
      redirect_to action: "index", alert: "削除できませんでした"
    end
  end


  private
  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
end