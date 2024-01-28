# Preview all emails at http://localhost:3000/rails/mailers/checkout
class CheckoutPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/checkout/creation_email
  def creation_email
    CheckoutMailer.creation_email
  end

end
