class SupermarketsController < ApplicationController
  def show
    @supermarket = Supermarket.find(params[:id])
    @customers = Customer.joins(:items).where(items: {supermarket_id: @supermarket.id}).distinct
  end
end