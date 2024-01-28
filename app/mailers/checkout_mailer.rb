class CheckoutMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.checkout_mailer.creation_email.subject
  #
  def creation_email(order)
    @order = order

    mail(
      subject: 'Your order has been completed',
      to: @order.email
    )
  end
end
