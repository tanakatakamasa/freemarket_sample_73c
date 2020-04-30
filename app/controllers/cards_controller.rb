class CardsController < ApplicationController
  def show
    item = Item.find(params[:id])
  end
end
