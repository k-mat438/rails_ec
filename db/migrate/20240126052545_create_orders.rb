# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :firstname
      t.string :lastname
      t.string :username
      t.string :email
      t.string :address1
      t.string :address2
      t.string :country
      t.string :state
      t.integer :zip
      t.string :cardname
      t.integer :cardnum
      t.integer :expiration
      t.integer :cvv
      t.integer :amount
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
