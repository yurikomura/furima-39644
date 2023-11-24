FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    addresses { '1-1' }
    phone_number { Faker::Number.decimal_part(digits: 11) }
    user_id { 1 }
    item_id { 1 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
