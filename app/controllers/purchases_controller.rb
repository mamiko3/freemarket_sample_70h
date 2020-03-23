class PurchasesController < ApplicationController
  require 'payjp'#Payjpの読み込み
  before_action :set_card, :set_item, :set_image, :set_address

  def index
    if @card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to new_card_path
    elsif @item.user_id != @card.user_id && @item.buyer_id.blank?
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
      # Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']#テスト環境で.envファイル呼ぶ時（本番環境対象外）
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@card.customer_id) 
      #カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(@card.card_id)
    else
      redirect_to root_path
    end
  end

  def pay
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    # Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']#テスト環境で.envファイル呼ぶ時（本番環境対象外）
    Payjp::Charge.create(
      :amount => @item.price, #支払金額を引っ張ってくる
      :customer => @card.customer_id,  #顧客ID
      :currency => 'jpy',              #日本円
    )
    @item.update(buyer_id: current_user.id) #itemsテーブルのbuyer_idに購入者のIDを入れる
    redirect_to done_item_purchases_path #完了画面に移動
  end

  def done
  end

  private
  def set_card
    if user_signed_in?
      @card = Card.find_by(user_id: current_user.id)
    else
      redirect_to new_user_registration_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_image
    @image = Image.find_by(item_id: params[:item_id])
  end

  def set_address
    if user_signed_in?
      @address = Address.find_by(user_id: current_user.id)
    else
      redirect_to new_user_registration_path
    end
  end
end
