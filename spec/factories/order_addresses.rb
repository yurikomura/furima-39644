FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    addresses { '1-1' }
    phone_number { Faker::Number.decimal_part(digits: 11) }
    user_id { Faker::Number.non_zero_digit }
    item_id { Faker::Number.non_zero_digit }
  end
end

    #post_code { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    #prefecture_id { Faker::Number.between(from: 1, to: 47) }
    #city { Faker::Address.city }
    #addresses { Faker::Address.street_address }
    #phone_number { Faker::Number.decimal_part(digits: 11) }
    #user_id { Faker::Number.non_zero_digit }
    #item_id { Faker::Number.non_zero_digit }