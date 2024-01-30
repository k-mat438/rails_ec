# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :cart
  has_many :order_products, dependent: :destroy

  validates :firstname, presence: true
  validates :email, presence: true
end
