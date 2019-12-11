class ItemsController < ApplicationController
  def index
  end

  def show
    render layout: 'items_show'
  end
end
