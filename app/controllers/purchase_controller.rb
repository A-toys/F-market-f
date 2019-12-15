class PurchaseController < ApplicationController
  require 'payjp'
  before_action :set_card
  def index
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = "sk_test_0e2395683608b1f458779eb8"
      if @card.card_id.nil?
        customer = Payjp::Customer.create(
          email: current_user.email,
          metadata: {user_id: current_user.id}
        )
        @card = Card.update(
          card_id: customer.default_card
        )
        redirect_to action: "update"
      end
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def update
    redirect_to action: "index"
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = "sk_test_0e2395683608b1f458779eb8"
    Payjp::Charge.create(
      :amount => 13500, #item.price
      :customer => card.customer_id,
      :currency => 'jpy',
    )
    redirect_to action: 'done'
  end

  def done
    
  end

  private
  def set_card
    @card = Card.find(params[:card_id])
  end

end
