# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.order(created_at: :desc).all
  end

  def show
    @product = Product.find(params[:id])

    @products = Product.order(created_at: :desc).where.not(id: params[:id]).limit(4)
  end
end
