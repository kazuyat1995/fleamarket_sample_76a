class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :confirm, :edit, :update, :destroy]
  before_action :set_category_parents, only: [:new, :create]
  before_action :set_category, only: [:edit, :update, :show, :confirm]
  before_action :set_seller, only: [:show, :confirm]

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
      @item = Item.new
      @item.images.new
    else
      redirect_to root_path, flash: {notice: "商品の出品にはログインする必要があります"}
    end
  end

  def edit
  end

  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to display_lists_user_path(current_user.id), flash: {notice: "商品の出品が完了しました"}
    else
      render :new
    end
  end

  def update
    # if false
    if @item.update(update_item_params)
      redirect_to display_lists_user_path, flash: {notice: "商品情報の編集が完了しました"}
    else
      render :edit
    end
  end

  def destroy
      if @item.seller_id == current_user.id && @item.destroy
        redirect_to display_lists_user_path(current_user.id), flash: {notice: "商品を削除しました"}
      else
        redirect_to display_lists_user_path(current_user.id), flash: {notice: "商品の削除に失敗しました"}
      end
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def set_category_parents
      @category_parents = Category.where(ancestry: nil)
    end

    def set_category
      @category_grandchild = Category.find(@item.category_id)
      @category_child = @category_grandchild.parent
      @category_parent = @category_grandchild.root
      
      @category_grandchildren = @category_grandchild.parent.children
      @category_children = @category_grandchild.parent.parent.children
      @category_parents = Category.where(ancestry: nil)
    end

    def set_seller
      @user = @item.seller
    end

    def item_params
      params.require(:item).permit(:name, :detail, :category_id, :brand, :condition, :postage, :area, :until_shipping, :price, :buyer_id, images_attributes: [:image]).merge(seller_id: current_user.id)
    end
      
    def update_item_params
      params.require(:item).permit(:name, :detail, :category_id, :brand, :condition, :postage, :area, :until_shipping, :price, :buyer_id, images_attributes: [:image, :_destroy, :id]).merge(seller_id: current_user.id)
    end

end
