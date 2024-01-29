# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # 全てのviewから使える
  helper_method :total_quantity
  before_action :current_cart

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

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
    @total = @current_cart.cart_products.inject(0) { |sum, cart_product| sum + cart_product.quantity }
  end
end
