# frozen_string_literal: true

class CartProductsController < ApplicationController
  def index
    @cart_products = current_product.all
    @subtotal = current_product.inject(0) do |sum, cart_product|
      sum + cart_product.quantity * cart_product.product.price.to_i
    end
  end

  def create
    @cart_product = current_product.find_by(product_id: params[:product_id])
    # カートの中に同じ商品がある場合とない場合
    unless @cart_product
      @cart_product = current_product.build(product_id: params[:product_id])
      @cart_product.save
    end
    if params[:quantity]
      # 数量指定で追加
      @cart_product.increment(:quantity, params[:quantity].to_i)
    else
      # ひとつ追加
      @cart_product.increment(:quantity, 1)
    end
    @cart_product.save
    redirect_to cart_products_path
  end

  def destroy
    @cart_product = current_product.find_by(product_id: params[:id])
    @cart_product.destroy
    redirect_to cart_products_path
  end

  private

  def current_product
    @current_cart.cart_products
  end
end
