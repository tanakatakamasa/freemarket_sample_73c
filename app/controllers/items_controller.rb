class ItemsController < ApplicationController
  require 'payjp'
 
  def confirm
    if Card.where(user_id: current_user.id).first.blank?
      redirect_to new_card_path, notice: 'クレジットカードの登録が必要です'
    else
      @user = current_user
      @card = Card.where(user_id: current_user.id).first
      @address = Address.where(user_id: current_user.id).first
      @item = Item.find(params[:id])
    #Payjpの秘密鍵を取得
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    #Payjpから顧客情報を取得し、表示
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)
      @card_brand = @card_information.brand 
      case @card_brand
      when "Visa"
        @card_src = "visa.png"
      when "JCB"
        @card_src = "jcb.png"
      when "MasterCard"
        @card_src = "mastercard.png"
      when "American Express"
        @card_src = "americanexpress.png"
      when "Diners Club"
        @card_src = "dinersclub.png"
      when "Discover"
        @card_src = "discover.png"
      end
    end
  end

  def pay
    @item = Item.find(params[:id])
    @card = Card.where(user_id: current_user.id).first

    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    charge = Payjp::Charge.create(
      amount: @item.price, #決済する値段、後ほど変数に変える必要あり
      customer: Payjp::Customer.retrieve(@card.customer_id),
      currency: 'jpy'
    )
    redirect_to done_item_path
  end

  def done
  end

  # before_action :set_params, only: :create

  def index
    @items = Item.order('created_at DESC').limit(3)
    @images = Image.all
  end

  def show
    @item = Item.find(params[:id])
    # 商品画像を取得
    item_id = @item.id
    @images = Image.where("item_id = #{item_id}")
    # 県名を取得
    @item_address = Prefecture.find_by_id(@item.prefecture_id)
    # 商品の状態を取得
    @item_condition = Condition.find_by_id(@item.condition_id)
    # 着払いか元払いかを取得
    @item_burden = Burden.find_by_id(@item.burden_id)
    # 発送までの期間を取得
    @item_duration = Duration.find_by_id(@item.duration_id)
    # 前の商品idを取得
    @p_item = Item.find(params[:id]).previous
    # 後ろの商品idを取得
    @n_item = Item.find(params[:id]).next
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    # 一旦root_pathに戻る
    redirect_to root_path
  end



  def new
    @item = Item.new
    # akama/itemモデルに紐づくimageモデルのインスタンス生成
    @item.images.new


    @category_parent_array = ["選択してください"]  
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def create
    Item.create(item_params)
    redirect_to root_path
  end

  def edit
  end

  def update
    
  end

  def destroy
  end



  private

  # def set_item
  #   @item = Item.find(params[:id])
  # end

  def item_params
    params.require(:item).permit(:name, :discription, :category_id, :condition_id, :burden_id, :prefecture_id, :duration_id, :price, images_attributes: [:item_image, :_destroy, :id] ).merge(user_id: current_user.id)
  end

  
end
