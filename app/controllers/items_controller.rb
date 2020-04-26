class ItemsController < ApplicationController
  def index
  end

  def show
    @item = Item.find(params[:id])
    item_id = @item.id
    @images = Image.where("item_id = #{item_id}")

    # 前の商品を取得
    @p_item = Item.find(params[:id]).previous
    # 後ろの商品を取得
    @n_item = Item.find(params[:id]).next
  end

  def new
  end

  def new_buy
  end
  
end
