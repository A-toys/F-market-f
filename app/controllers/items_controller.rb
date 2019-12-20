class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy, :edit, :update]
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
    @user = User.find(@item[:seller_user_id])
    @items = Item.where(seller_user_id: @user[:id]).where.not(id: params[:id])
    @images = @item.images
    render layout: 'items_show'
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render item_path
    end
  end

  def edit
    @item.images.build
    render layout: 'devise'
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      redirect_to edit_item_path(@item)
    end
  end
     
   


  private
  def item_params
    params.require(:item).permit(:name,:text,:condition,:fee_burden,:service,:prefecture_id,:handing_time,:price,:trading_status,:service,:category_id, 
    images_attributes:(:image_url)).merge(seller_user_id:current_user.id)
  end

  def image_params
    #imageのストロングパラメータの設定.js側でimagesをrequireすれば画像のみを引き出せるように設定する。
    params.require(:images).permit({:images => []})
  end

  def set_item
    @item = Item.find(params[:id])
  end


  def set_user
    @user = User.where(id: current_user.id).first if user_signed_in?
  end
end
