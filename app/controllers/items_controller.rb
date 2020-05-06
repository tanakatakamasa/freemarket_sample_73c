class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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
      amount: @item.price,
      customer: Payjp::Customer.retrieve(@card.customer_id),
      currency: 'jpy'
    )
    @buyer = Item.find(params[:id])
    @buyer.update( buyer_id: current_user.id)
    redirect_to done_item_path, notice: '購入が完了しました'

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
  # 以下全て、formatはjsonのみ
  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    respond_to do |format| 
      format.html
      format.json do
        @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
      end
    end
  end
  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
  #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    respond_to do |format| 
      format.html
      format.json do
        @category_grandchildren = Category.find("#{params[:child_id]}").children
      end
    end
  end


  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])

    grandchild_category = @item.category
    child_category = grandchild_category.parent

    @category_parent_array = ["選択してください"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end

    @category_children_array = []
    Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children_array << children
    end

    @category_grandchildren_array = []
    Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
      @category_grandchildren_array << grandchildren
    end

    # @category_parent_array = ["選択してください"]  
    # Category.where(ancestry: nil).each do |parent|
    #   @category_parent_array << parent.name
    #   # @category_parent_array = ["#{parent.name}"]
    #   @category_child_array = ["選択してください"]  
    #   Category.where(ancestry: parent).each do |child|
    #     @category_child_array << child.name
    #     @category_grandchild_array = ["選択してください"]  
    #     Category.where(ancestry: child).each do |grandchild|
    #       @category_grandchild_array << grandchild.name
    #     end
    #   end
    # end
    
    
  end

  def update
    item = Item.find(params[:id])
    
    if item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end



  private

  # def set_item
  #   @item = Item.find(params[:id])
  # end

  def item_params
    params.require(:item).permit(:name, :discription, :category_id, :condition_id, :burden_id, :prefecture_id, :duration_id, :price, images_attributes: [:item_image, :_destroy, :id] ).merge(seller_id: current_user.id)
  end 

end
