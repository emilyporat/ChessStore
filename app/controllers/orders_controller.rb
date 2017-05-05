class OrdersController < ApplicationController
  before_action :check_login

  def new
    @order = Order.new
  end

  def show
    @items = @order.order_items
  end

  def create 
    @order = Order.new(order_params)
    @order.expiration_year = @order.expiration_year.to_i
    @order.expiration_month = @order.expiration_month.to_i
    @order.user_id = current_user.id
    @order.grand_total = calculate_cart_items_cost
    puts @order.save
    if @order.save
      puts "???"
      @order.pay
      puts "hello"
      save_each_item_in_cart(@order)
      puts "no?"
      redirect_to home_path
    else
      render action: 'new'
    end
  end

  private

  def order_params
    params.require(:order).permit(:date, :school_id, :user_id, :grand_total, 
    :payment_receipt, :credit_card_number, :expiration_month, :expiration_year)

  end
  
end