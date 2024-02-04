# frozen_string_literal: true

class CartProductsController < ApplicationController
  def index
    @cart_products = @current_cart.cart_products.all
    @subtotal = @current_cart.use_or_not_coupon
    @order = Order.new(flash[:order])
    @coupon = Coupon.new
  end

  def create
    @cart_product = @current_cart.cart_products.find_or_create_by(product_id: params[:product_id])
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
    @cart_product = @current_cart.cart_products.find_by(product_id: params[:id])
    @cart_product.destroy
    redirect_to cart_products_path
  end

  def update
    @coupon = Coupon.find_by(coupon_params)
    if @coupon
      @coupon.update(cart_id: @current_cart.id)
      flash[:notice] = '適用されました'
    else
      flash[:notice] = 'お使いになったクーポンコードは、このコースでは無効です'
    end
    redirect_to cart_products_path
  end

  private

  def coupon_params
    params.require(:coupon).permit(:code)
  end
end
