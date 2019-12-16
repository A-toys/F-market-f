class CardsController < ApplicationController
  
  require 'payjp'
  before_action :set_card

  def new
    redirect_to action: "index" if card.present?
  end

  def create #PayjpとCardのデータベース作成の実施
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: 'test',
      email: current_user.email,
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @card = Card.new( user_id: current_user.id, 
                        customer_id: customer.id,
                        card_id: customer.default_card
                      )
      if @card.save
        redirect_to action: "index"
      else
        redirect_to action: "create"
      end
    end
  end

  def delete #PayjpとCardのデータベースを削除
    if card.blank?
      redirect_to action: "create"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
      redirect_to action: "new"
    end
  end

  def show #CardデータをPayjpに送り、情報を引き出す
    if card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  private

  def set_card
    card = Card.where(user_id: current_user.id).first
  end
end
