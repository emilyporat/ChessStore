class HomeController < ApplicationController
  
  def home
    @boards = Item.active.for_category('boards').alphabetical.paginate(:page => params[:page]).per_page(10)
    @pieces = Item.active.for_category('pieces').alphabetical.paginate(:page => params[:page]).per_page(10)
    @clocks = Item.active.for_category('clocks').alphabetical.paginate(:page => params[:page]).per_page(10)
    @supplies = Item.active.for_category('supplies').alphabetical.paginate(:page => params[:page]).per_page(10)
    @items_to_reorder = Item.need_reorder.alphabetical.to_a
    @order_history = (current_user.orders.chronological unless current_user.nil?)
    @address_book = (current_user.user_schools unless current_user.nil?)
    @items_to_ship = OrderItem.unshipped.chronological
  end

  def about
  end

  def contact
  end

  def privacy
  end

  def profile
    @items_to_reorder = Item.need_reorder.alphabetical.to_a
    @order_history = (current_user.orders.chronological.to_a unless current_user.nil?)
    @address_book = (current_user.user_schools unless current_user.nil?)
    @items_to_ship = OrderItem.unshipped.chronological   
  end
  
end