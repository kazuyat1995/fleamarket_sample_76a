class CardsController < ApplicationController
  require 'payjp'
  before_action :move_to_root
  before_action :set_card, only: [:new, :show, :delete, :payment]
  before_action :set_payjp_key, only: [:new, :show, :delete, :payment]
  before_action :set_item, only: [:payment]

  def new
    if @card.present?
      redirect_to card_path(current_user.id)
    else
      card = Card.where(user_id: current_user.id)
    end
  end

  def create
    if params['payjp-token'].blank?
      redirect_to action: :new
    else
      customer = Payjp::Customer.create(
        card: params['payjp-token'],
        metadata: {user_id: current_user.id},
        description: 'test'
      )
      card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if card.save 
        render action: :finished
      else
        redirect_to action: :new
      end
    end
  end

  def show
    @user = User.find(params[:id])
    if @card.present?
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)
    else
      redirect_to action: :new, id: current_user.id
    end

    @card_brand = @card_information.brand

    case @card_brand
    when "Visa"
      @card_src = "card/Visa.svg"
    when "JCB"
      @card_src = "card/JCB.png"
    when "MasterCard"
      @card_src = "card/Master.png"
    when "American Express"
      @card_src = "card/amex.svg"
    when "Diners Club"
      @card_src = "card/Diners.png"
    when "Discover"
      @card_src = "card/discover.png"
    end
  end

  def finished
  end

  def delete
    if @card.present?
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
    end
      redirect_to action: :new, id: current_user.id
  end

  def payment
    if @card.present?
      customer = Payjp::Customer.retrieve(@card.customer_id)
      Payjp::Charge.create(
      amount: @item.price,
      customer: customer,
      currency: 'jpy'
      )
      @item.update!(stock: 0)
      @item.update!(buyer_id: current_user.id)
    else
      flash[:notice] = '購入するには支払い方法の登録が必要です'
      redirect_to action: :new
    end
  end

  def completed
  end

  private
  def move_to_root
    redirect_to root_path unless user_signed_in?
  end

  def set_card 
    @card = Card.find_by(user_id: current_user.id)
  end

  def set_payjp_key
    Payjp.api_key = Rails.application.credentials[:PAYJP_SECRET_KEY]
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
