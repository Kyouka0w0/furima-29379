FactoryBot.define do
  factory :purchase do
    # number {'4242424242424242'}
    # exp_month {'12'}
    # exp_year {'24'}
    # cvc {'123'}
    token {'1111111111111'}
    post_code { '123-4567' }
    shipment_id { 2 }
    city { '東京都' }
    house_number { '1-1' }
    building_number { '東京ハイツ' }
    phone_number {'09012341234'}

    user_id {create(:user).id}
    item_id {create(:item).id}

    # association :user
    # association :item
  end
end
