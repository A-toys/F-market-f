class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  def card
  end
end
