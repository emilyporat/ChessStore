class PurchasesController < ApplicationController
  before_action :check_login
  authorize_resource
  
  def index
    @purchases = Purchase.chronological.to_a
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.date = Date.current
    
    if @purchase.save
      respond_to do |format|
        format.html { redirect_to request.referrer, notice: "Successfully added a purchase for #{@purchase.quantity} #{@purchase.item.name}s."}
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
  def purchase_params
    params.require(:purchase).permit(:item_id, :quantity)
  end
  
end