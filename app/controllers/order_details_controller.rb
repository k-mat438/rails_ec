# frozen_string_literal: true

class OrderDetailsController < ApplicationController
  before_action :basic_auth
  def index
    @orders = Order.order(created_at: :desc).limit(5)
  end

  def show
    @order = Order.find(params[:id])
  end
end
