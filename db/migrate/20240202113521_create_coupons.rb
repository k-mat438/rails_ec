# frozen_string_literal: true

class CreateCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :coupons do |t|
      t.string :code
      t.integer :discount_amount
      t.references :cart, foreign_key: true

      t.timestamps
    end
  end
end
