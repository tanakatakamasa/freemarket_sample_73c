class PurchaseController < ApplicationController
  require 'payjp'

  def index
    @item = Item.find(params[:item_id])
  end

  def pay
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    Payjp::Charge.create(
      amount: 222, # 決済する値段
      card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
      currency: 'jpy'
    )
    redirect_to action: 'done' #完了画面に移動
  end

  def done
  end
end
