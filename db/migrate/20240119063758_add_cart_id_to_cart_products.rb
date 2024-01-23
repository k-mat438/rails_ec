# frozen_string_literal: true

class AddCartIdToCartProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_products, :cart_id, :integer
  end
end
