# frozen_string_literal: true

class CreateCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :coupons do |t|
      t.string :code
      t.integer :discount_amount

      t.timestamps
    end
  end
end
