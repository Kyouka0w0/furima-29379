FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { '00000a' }
    password_confirmation { password }
    first_name { 'ぜんかく' }
    last_name { 'ぜんかく' }
    first_name_kana { 'ゼンカクカナ' }
    last_name_kana { 'ゼンカクカナ' }
    birthday { '2020-01-01' }
  end
end
