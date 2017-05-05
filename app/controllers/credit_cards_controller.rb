class CreditCardsController < ApplicationController
  
  def new
    @credit_card = CreditCard.new(:number, :expiration_year, :expiration_month)
  end

  def create
    @credit_card = CreditCard.new(:number, :expiration_year, :expiration_month)
    if !@credit_card.save
      render action: 'new'
    end
  end
  
end