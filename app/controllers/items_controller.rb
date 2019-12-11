class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  def card
  end

  def show
    render layout: 'items_show'
  end
end
