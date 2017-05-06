class OrderItemsController < ApplicationController
  before_action :check_login

  def complete
  	@order_item = OrderItem.find(params[:order_item_id])
    @order_item.shipped

    if @order_item.save!
      flash[:notice] = 'Order was marked as shipped.'
      if params[:status] == "task_details"
      end
      redirect_to home_path
    else
      render :action => "edit"
    end
  end

end