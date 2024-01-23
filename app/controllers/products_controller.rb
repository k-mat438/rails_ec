# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.order(created_at: :desc).all
    @cart_product = CartProduct.new
  end

  def show
    @product = Product.find(params[:id])
    @products = Product.order(created_at: :desc).where.not(id: params[:id]).limit(4)
    @cart_product = CartProduct.new
  end
end
