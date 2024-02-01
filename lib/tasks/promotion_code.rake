# frozen_string_literal: true

namespace :promotion_code do
  desc 'promotion_code生成' # 説明
  task generate: :environment do
    records = []
    10.times  do
      chars = ('A'..'Z').to_a + ('0'..'9').to_a
      int = (100..1000).to_a
      object = { code: chars.sample(7).join, discount_amount: int.sample }
      records << object
    end

    records.each do |record|
      Coupon.create(
        code: record[:code],
        discount_amount: record[:discount_amount]
      )
    end
  end
end
