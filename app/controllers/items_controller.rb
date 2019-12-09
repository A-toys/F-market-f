class ItemsController < ApplicationController
  def index
  end

  def registration_page
    render layout: :false
  end

  def login_page
    render :layout => false
  end
  
end
