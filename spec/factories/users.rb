FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    first_name { '次郎' }
    last_name { '降間' }
    first_name_kana { 'ジロウ' }
    last_name_kana { 'フリマ' }
    birth_day { 2000 - 11 - 0o7 }
  end
end
