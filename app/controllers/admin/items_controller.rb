# frozen_string_literal: true

module Admin
  class ItemsController < ApplicationController
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
        redirect_to admin_items_path
      else
        flash[:error_messages] = @product.errors.full_messages
        flash[:product] = @product
        redirect_to new_admin_item_path
      end
    end

    def edit; end

    def update
      @product.update(product_params)
      redirect_to admin_items_path
    end

    def destroy
      @product.destroy && @product.image.purge
      redirect_to admin_items_path
    end

    private

    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
      end
    end

    def product_params
      params.require(:product).permit(:name, :price, :description, :image)
    end

    def set_target_product
      @product = Product.find(params[:id])
    end
  end
end