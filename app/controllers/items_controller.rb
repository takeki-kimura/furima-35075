class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :category_id, :price, :user, :status_id, :fee_id, :prefectures_id, :date_id, :description)
  end

end
