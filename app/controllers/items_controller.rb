class ItemsController < ApplicationController

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
    Category.where(ancestry: 0).each do |parent|
      @category_parent_array << parent.name
    end
  end
  # 以下全て、formatはjsonのみ
  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: 0).children
  end
  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
  #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end


  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    
  end



  private

  # def set_item
  #   @item = Item.find(params[:id])
  # end

  def item_params
    params.require(:item).permit(:name, :discription, :category_id, :condition_id, :burden_id, :prefecture_id, :duration_id, :price, images_attributes: [:item_image, :_destroy, :id] ).merge(seller_id: current_user.id)
  end 

end
