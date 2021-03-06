class CartController < ApplicationController
  include ChessStoreHelpers::Cart

  def index
    @cart_items = get_list_of_items_in_cart
    @total = calculate_cart_items_cost
  end

  def update(quantity = 1)
    @item = Item.find(params[:item_id])
    add_item_to_cart(@item.id.to_s)
    respond_to do |format|
      name = "Added " + @item.name  + " to cart!"
      format.html { redirect_to cart_index_path, notice: name } 
      format.js
    end
  end

  def remove
    @item = Item.find(params[:item_id])
    remove_item_from_cart(@item.id.to_s)
    respond_to do |format|
      name = "Removed " + @item.name + " from cart!"
      format.html { redirect_to cart_index_path(@item), notice: name } 
      format.js
    end
  end

  def removeone
    @item = Item.find(params[:item_id])
    remove_one_from_cart(@item.id.to_s)
    respond_to do |format|
      name = "Removed " + @item.name + " from cart!"
      format.html { redirect_to cart_index_path(@item), notice: name } 
      format.js
    end
  end


end