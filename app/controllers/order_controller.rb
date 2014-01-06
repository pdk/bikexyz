class OrderController < ApplicationController
  layout "boot_simple"

  def index
    @order = Order.new
    @include_stripe_js = true
  end

  def create
    @order = Order.new(params[:order])

    if @order.save
      render action: "accepted"
    else
      flash.now[:error] = 'There were problems processing your order. See below.'
      render action: "index"
    end    
  end

end
