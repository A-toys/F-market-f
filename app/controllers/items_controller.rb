class ItemsController < ApplicationController
  before_action :set_user 
  
  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
    @item.images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end
  
  def show
    @item = Item.find(params[:id])
    render layout: 'items_show'
  end

  private
  def item_params
    params.require(:item).permit(:name,:text,:condition,:fee_burden,:service,:area,:handing_time,:price,:trading_status,:service,:category_id, 
    images_attributes:(:image_url)).merge(seller_user_id:current_user.id)
  end

  def image_params
    #imageのストロングパラメータの設定.js側でimagesをrequireすれば画像のみを引き出せるように設定する。
    params.require(:images).permit({:images => []})
  end

  def set_user
    @user = User.where(id: current_user.id).first if user_signed_in?
  end
end
