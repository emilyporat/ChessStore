#authorize_resource
class ItemPricesController < ApplicationController
  before_action :check_login
  authorize_resource
  
  def index
    @active_items = Item.active.alphabetical.to_a
  end

  def new
    @item_price = ItemPrice.new
    @item = Item.find_by_id(params[:this_item_id])
  end

  def create
    @item_price = ItemPrice.new(item_price_params)
    @item_price.start_date = Date.current
    @item_price.category = "wholesale"
    if @item_price.save
      @item = Item.find_by_id(@item_price.item_id)
      respond_to do |format|
        format.html { redirect_to item_path(@item), notice: "Changed the price of #{@item.name}." } 
        format.js
      end
    else
      respond_to do |format|
        format.html { render action: 'new' }
        format.js
      end
    end
  end

  private
  def item_price_params
    params.require(:item_price).permit(:item_id, :price, :category)
  end
  
end 