# frozen_string_literal: true

class CheckoutsController < ApplicationController
  def create
    @order = @current_cart.orders.build(order_params)
    @order.amount = @current_cart.use_or_not_coupon

    ActiveRecord::Base.transaction do
      @order.save!
      create_order_products
    end
    if @order.present?
      OrderMailer.creation_email(@order).deliver_later
      flash[:notice] = '購入ありがとうございます'
      @current_cart.cart_products.destroy_all
      @current_cart.coupon.update(cart_id: nil)
      redirect_to products_path
    end
  rescue StandardError
    order_fail
  end

  private

  def order_params
    params.require(:order).permit(:firstname, :lastname, :username, :email, :address1, :address2, :country, :state,
                                  :zip, :cardname, :cardnum, :expiration, :cvv, :cart_id)
  end

  def create_order_products
    @current_cart.cart_products.each do |cart_product|
      @order.order_products.create!(name: cart_product.product.name,
                                    price: cart_product.product.price,
                                    quantity: cart_product.quantity)
    end
  end

  def order_fail
    flash[:error_messages] = @order.errors.full_messages
    flash[:order] = @order
    redirect_to cart_products_path
  end
end
