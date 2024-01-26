# frozen_string_literal: true

class CheckoutsController < ApplicationController
  def create
    @order = Order.new(order_params)
    @order.cart_id = @current_cart.id
    @order.amount = @current_cart.cart_products.inject(0) do |sum, cart_product|
      sum + cart_product.quantity * cart_product.product.price.to_i
    end
    if @order.save
      flash[:notice] = '購入ありがとうございます'
      redirect_to products_path
    else
      redirect_to cart_products_path
    end
  end

  private

  def order_params
    params.require(:order).permit(:firstname, :lastname, :username, :email, :address1, :address2, :country, :state,
                                  :zip, :cardname, :cardnum, :expiration, :cvv, :cart_id)
  end
end
