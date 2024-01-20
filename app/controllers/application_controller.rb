# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # 全てのviewから使える
  helper_method :total_quantity
  before_action :current_cart

  private

  def current_cart
    # sessionあれば、session維持
    if session[:cart_id]
      @current_cart ||= Cart.find_by(id: session[:cart_id])
    else
      # カートオブジェクトを作成してsession作成
      @current_cart = Cart.create
      session[:cart_id] = @current_cart.id
    end
  end

  def total_quantity
    @total = if @current_cart
               @current_cart.cart_products.inject(0) { |sum, cart_product| sum + cart_product.quantity }
             else
               0
             end
  end
end
