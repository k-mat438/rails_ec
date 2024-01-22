# frozen_string_literal: true

class Product < ApplicationRecord
  has_one_attached :image
  has_many :cart_products, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999_999 },
                    format: { with: /\A[0-9]+\z/ }
  validates :image, presence: true, blob: { content_type: :image }
end
