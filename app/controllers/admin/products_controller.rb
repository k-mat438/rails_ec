# frozen_string_literal: true

module Admin
  class ProductsController < ApplicationController
    before_action :basic_auth
    before_action :set_target_product, only: %i[edit update destroy]

    def index
      @products = Product.order(created_at: :desc).all
    end

    def new
      @product = Product.new(flash[:product])
    end

    def create
      @product = Product.new(product_params)

      if @product.save
        redirect_to admin_products_path
      else
        flash[:error_messages] = @product.errors.full_messages
        flash[:product] = @product
        redirect_to new_admin_product_path
      end
    end

    def edit; end

    def update
      @product.update(product_params)
      redirect_to admin_products_path
    end

    def destroy
      @product.destroy && @product.image.purge
      redirect_to admin_products_path
    end

    private

    def product_params
      params.require(:product).permit(:name, :price, :description, :image)
    end

    def set_target_product
      @product = Product.find(params[:id])
    end
  end
end
