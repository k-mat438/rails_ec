# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_products, dependent: :destroy
  has_many :orders, dependent: :destroy

  def total_amount
    cart_products.inject(0) do |sum, cart_product|
      sum + cart_product.quantity * cart_product.product.price.to_i
    end
  end
end
