class PurchasesController < ApplicationController
  before_action :set_item
  before_action :set_img
  before_action :confirm_item_seller_is_not_buyer

  require 'payjp'

  def index
    # if current_user.present?
    @address = Address.find_by(user_id: current_user.id)
    @card = Card.find_by(user_id: current_user.id)
    @trade = Trade.new
    if @card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "cards", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    @card = Card.find_by(user_id: current_user.id)
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    Payjp::Charge.create(
    :amount => @item.price, #支払金額を入力（itemテーブル等に紐づけても良い）
    :customer => @card.customer_id, #顧客ID
    :currency => 'jpy', #日本円
    )
    @trade = Trade.new
    @trade.item_id = params[:id]
    @trade.buyer_id = current_user.id
    @trade.rating = 0
    @trade.status = 0
    @item.update_attribute(:trade_step, "交渉中")
    redirect_to done_purchase_path if @trade.save!
  end


def done
end

private 

  def trade_params
    params.require(:trade).permit(:item_id, :buyer_id, :status, :rating).merge(buyer_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def confirm_item_seller_is_not_buyer
    redirect_to root_path if @item.seller_id == current_user.id
  end

  def set_img
    @item_img = ItemImg.where(item_id: @item[:id])[0]
  end

end