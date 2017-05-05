class HomeController < ApplicationController
  
  def home
    @items_to_reorder = Item.need_reorder.alphabetical.to_a
    @order_history = (current_user.orders.chronological.to_a unless current_user.nil?)
    @address_book = (current_user.user_schools unless current_user.nil?)
    @items_to_ship = OrderItem.unshipped.chronological
  end

  def about
  end

  def contact
  end

  def privacy
  end
  
end