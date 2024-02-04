# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_products, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one :coupon, dependent: :destroy

  def total_amount
    cart_products.inject(0) do |sum, cart_product|
      sum + cart_product.quantity * cart_product.product.price.to_i
    end
  end

  def use_or_not_coupon
    # クーポンを使うか使わないか
    if coupon.present?
      # クーポンあり時にマイナスにならないためのもの。
      if total_amount < coupon.discount_amount
        0
      else
        total_amount - coupon.discount_amount
      end
    else
      total_amount
    end
  end
end
