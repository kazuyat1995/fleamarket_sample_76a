class ItemsController < ApplicationController
  def index
  end

  def show
  end

  def confirm
  end

  def new
    if user_signed_in?
      @item = Item.new
      @item.images.new
    else
      redirect_to root_path, flash: {notice: "商品の出品にはログインする必要があります"}
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, flash: {notice: "商品の出品が完了しました"}
    else
      render :new
    end
  end

  private
    def item_params
      params.require(:item).permit(:name, :detail, :brand, :condition, :postage, :area, :until_shipping, :price, :buyer_id, images_attributes: [:image]).merge(seller_id: current_user.id)
    end


end
