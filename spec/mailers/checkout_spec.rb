# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CheckoutMailer, type: :mailer do
  describe 'creation_email' do
    let(:mail) { described_class.creation_email }

    it 'renders the headers' do
      expect(mail.subject).to eq('Creation email')
      expect(mail.to).to eq(['to@example.org'])
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Hi')
    end
  end
end
