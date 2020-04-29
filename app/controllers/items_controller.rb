class ItemsController < ApplicationController

  # before_action :set_params, only: :create

  def index
  end

  def show
  end

  def new
    @item = Item.new
    # akama/itemモデルに紐づくimageモデルのインスタンス生成
    @item.images.new

   

  end

  def create
    Item.create!(item_params)
    redirect_to root_path
    # binding.pry
  end

  def edit
  end

  def update
    
  end

  def destroy
  end


  def new_buy
  end

  private

  # def set_item
  #   @item = Item.find(params[:id])
  # end

  def item_params
    params.require(:item).permit(:name, :discription, :category_id, :condition_id, :burden_id, :prefecture_id, :duration_id, :price, images_attributes: [:item_image, :_destroy, :id] ).merge(user_id: current_user.id)
  end

  
end
