class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :confirm]

  def index
    @items = Item.includes(:images).order ('created_at DESC')
    @items_price = Item.includes(:images).order('price ASC')
  end

  def show
  end

  def confirm
  end

  def new
    if user_signed_in?
      @items = Item.new
      @items.images.new
    else
      redirect_to root_path, flash: {notice: "商品の出品にはログインする必要があります"}
    end
  end

  def edit
    @items = Item.find(params[:id])
  end

  def create
    @items = Item.new(item_params)
    if @items.save
      redirect_to display_lists_user_path(current_user.id), flash: {notice: "商品の出品が完了しました"}
    else
      render :new
    end
  end

  def update
    @items = Item.find(params[:id])
    if @items.update(update_item_params)
      redirect_to display_lists_user_path, flash: {notice: "商品情報の編集が完了しました"}
    else
      render :edit
    end
  end

  private
    def item_params
      params.require(:item).permit(:name, :detail, :brand, :condition, :postage, :area, :until_shipping, :price, :buyer_id, images_attributes: [:image]).merge(seller_id: current_user.id)
    end
    
    def set_item
      @item = Item.find(params[:id])

    def update_item_params
      params.require(:item).permit(:name, :detail, :brand, :condition, :postage, :area, :until_shipping, :price, :buyer_id, images_attributes: [:image, :_destroy, :id]).merge(seller_id: current_user.id)
    end

end
