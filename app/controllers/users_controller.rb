class UsersController < ApplicationController
  before_action :move_to_root, except: [:show, :destroy]

  def index
  end

  def show
    @exhibits = Item.where(seller_id: current_user.id).where(stock: 1).count
  end

  def edit
  end

  def sold_lists
    @items = Item.includes(:images).where(buyer_id: current_user.id).order('created_at DESC')
  end

  def display_lists
    @items = Item.includes(:images).where(seller_id: current_user.id).order('created_at DESC')
  end

  def confirm_deletion
    @item = Item.find(params[:id])
    @user = @item.seller
  end

  def confirm_edit
  end

  private
  def move_to_root  #ログインしていなければ、トップ画面に遷移
    redirect_to root_path unless user_signed_in?
  end
end
