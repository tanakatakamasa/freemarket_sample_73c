class ItemsController < ApplicationController
  def index
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
  end

  def new_buy
  end
  
end
