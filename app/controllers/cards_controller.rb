class CardsController < ApplicationController

  require "payjp"

  def new
    if user_signed_in?
      card = Card.where(user_id: current_user.id)
      redirect_to action: "show" if card.exists?
    else
      redirect_to new_user_registration_path
    end
  end

  def pay #payjpとCardのデータベース作成を実施。
    # Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"] #テスト環境で.envファイル呼ぶ時（本番環境対象外）
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: '登録テスト', #なくてもOK
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) #metadataにuser_id入れる。なくてもOK
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete #PayjpとCardデータベースを削除。
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      # Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]#テスト環境で.envファイル呼ぶ時（本番環境対象外）
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  def show #Cardのデータpayjpに送り情報を取り出す。
    if user_signed_in?
      card = Card.where(user_id: current_user.id).first
      if card.blank?
        redirect_to action: "new" 
      else
        # Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]#テスト環境で.envファイル呼ぶ時（本番環境対象外）
        Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
        customer = Payjp::Customer.retrieve(card.customer_id)
        @default_card_information = customer.cards.retrieve(card.card_id)
      end
    else
      redirect_to new_user_registration_path
    end
  end
end