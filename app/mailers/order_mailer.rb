# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  def creation_email(order)
    @order = order

    mail(
      subject: 'Your order has been completed',
      to: @order.email
    )
  end
end
