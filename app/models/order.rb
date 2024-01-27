# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :cart
  has_many :order_products, dependent: :destroy
end
